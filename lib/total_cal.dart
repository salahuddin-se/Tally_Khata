/*
import 'package:flutter/material.dart';
import 'package:tallykhata/details.dart';
import 'helpers/database_helper.dart';
import 'package:get/get.dart';
import 'models/contact.dart';

void main()=>runApp(CalTot());

class CalTot extends StatelessWidget {

  //ContactDetailsPage

  final navigatorKey= GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          //primaryColor: Color(0xFF12a644),
            primaryColor: Colors.cyan[600]
        ),
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        home:Scaffold(
          appBar: AppBar(
            title: Text("Due List",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold)),
          ),
          body: TotPage(),
        )
    );
  }
}


// ignore: must_be_immutable
class TotPage extends StatelessWidget {

  var dueTk=ContactDetailsPage();
  @override
  Widget build(BuildContext context) {
    var db = new DatabaseHelper();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<List>(
            future: db.findAll(),
            builder: (context, AsyncSnapshot<List> snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,index){
                      Contact contact = Contact.fromJson(snapshot.data[index]);

                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15,10,20,10),
                        child: Row(
                          children: [

                            Text(("${contact.name} = "), style: TextStyle(fontWeight: FontWeight.bold,color:Colors.teal[600],fontSize: 21.0)),
                            Text("${contact.rate} Tk", style: TextStyle(fontWeight: FontWeight.bold,fontSize:17.0,color: Colors.black )),
                            /*Card(
                              color: Colors.greenAccent[100],
                              child: ListTile(
                                title: Text(contact.name,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.teal[600],fontSize: 21.0)),
                                subtitle: Text(contact.rate,style: TextStyle(fontWeight: FontWeight.bold,fontSize:17.0,color: Colors.black )),

                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactDetailsPage(contact: contact,)));
                                },
                              ),
                            ),*/

                            Text(contact.rate)

                          ]
                        ),


                      );
                    }

                    );
              }
              else{
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
*/
