import 'package:flutter/material.dart';
import 'package:tallykhata/details.dart';
import 'package:tallykhata/helpers/database_helper.dart';
import 'package:tallykhata/models/contact.dart';

void main()=>runApp(MyApp2());

class MyApp2 extends StatelessWidget {
  final navigatorKey= GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("List Of Members",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold)),
          ),
          body: MyHomePage(),

    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = new DatabaseHelper();
    return Padding(
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
                    padding: const EdgeInsets.fromLTRB(20,8,20,8),
                    child: Card(
                      color: Colors.black,
                      child: ListTile(
                        title: Text(contact.name,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize: 21.0)),
                        subtitle: Text(contact.phone,style: TextStyle(fontWeight: FontWeight.bold,fontSize:17.0,color: Colors.white )),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactDetailsPage(contact: contact,)));
                        },
                      ),
                    ),
                  );

                  /*return Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,10),
                    child: Card(
                      color: Colors.greenAccent[100],
                      child: ListTile(
                        title: Text(contact.name,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.teal[600],fontSize: 21.0)),
                        subtitle: Text(contact.phone,style: TextStyle(fontWeight: FontWeight.bold,fontSize:17.0,color: Colors.black )),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactDetailsPage(contact: contact,)));
                        },
                      ),
                    ),
                  );*/


                });
          }
          else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
