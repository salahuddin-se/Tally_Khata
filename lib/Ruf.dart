/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tallykhata/mainEdit.dart';
import 'package:tallykhata/edit.dart';
import 'package:tallykhata/helpers/database_helper.dart';
import 'package:tallykhata/models/contact.dart';
import 'package:tallykhata/edit2.dart';
import 'secondPage.dart';
import 'main.dart';

// ignore: must_be_immutable
void main()=> runApp(
    MaterialApp(
      home: ContactDetailsPage(),
      //title: "ListView",
      debugShowCheckedModeBanner: false,
    )
);

// ignore: must_be_immutable
class ContactDetailsPage extends StatefulWidget {
  Contact contact;
  ContactDetailsPage({Key key, this.contact}) : super(key: key);
  @override
  _ContactDetailsPageState createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {

  double res1 = 0,res2=0,f1,f2,f3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(

          title: Text("Contact Details",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25,10,25,10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: 25.0,
                ),

                Text("Name",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.cyan,fontSize: 20.0),),
                Text(widget.contact.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize:18.0,color: Colors.black ),),

                SizedBox(
                  height: 20.0,
                ),


                Text("Address",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.cyan,fontSize: 20.0),),
                Text(widget.contact.village,style: TextStyle(fontWeight: FontWeight.bold,fontSize:18.0,color: Colors.black ),),


                SizedBox(
                  height: 20.0,
                ),

                Text("Phone",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.cyan,fontSize: 20.0),),
                Text(widget.contact.phone,style: TextStyle(fontWeight: FontWeight.bold,fontSize:18.0,color: Colors.black )),


                SizedBox(
                  height: 20.0,
                ),


                Text("Due (TK)",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.cyan,fontSize: 20.0),),
                Text(widget.contact.rate,style: TextStyle(fontWeight: FontWeight.bold,fontSize:18.0,color: Colors.black )),


                SizedBox(
                  height: 20.0,
                ),

                Text("Collection(TK)",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.cyan,fontSize: 20.0),),
                Text(widget.contact.collection,style: TextStyle(fontWeight: FontWeight.bold,fontSize:18.0,color: Colors.black )),

                SizedBox(
                  height: 20.0,
                ),

                Text("Current Due(TK)",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.cyan,fontSize: 20.0),),
                Text(widget.contact.due,style: TextStyle(fontWeight: FontWeight.bold,fontSize:18.0,color: Colors.black )),

                SizedBox(
                  height: 30.0,
                ),



                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: RaisedButton(
                            child: Text("Edit",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> EditPage3(contact: widget.contact)));
                            },
                          )
                      ),
                      Padding(padding: EdgeInsets.only(left: 5,right: 5)),
                      Expanded(
                          child: RaisedButton(
                            child: Text("Delete",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold)),
                            onPressed: () {
                              showDialog(context: context,builder: (BuildContext context){
                                return new AlertDialog(
                                  title: Text("Confirm"),
                                  content: Text("Are you sure ?"),
                                  actions: <Widget>[
                                    FlatButton(onPressed: ()async{
                                      var db= DatabaseHelper();
                                      await db.delete(widget.contact.id);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>MyApp()));
                                    }, child: Text("Ok")),
                                    FlatButton(onPressed: () {
                                      Navigator.pop(context);
                                    },
                                        child: Text("cancel")),
                                  ],
                                );
                              });
                            },
                          )
                      ),
                      Padding(padding: EdgeInsets.only(left: 5,right: 5)),
                      Expanded(
                          child: RaisedButton(
                            child: Text("Cancel",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp2()));
                            },
                          )
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 50.0,
                ),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Container(
                      color: Colors.lightBlueAccent,
                      height: 50.0,
                      child: Container(
                        height: 40.0,
                        child: FlatButton(
                          child: Text("Add  Due",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> EditPage(contact: widget.contact)));
                          },
                        ),

                      ),
                    ),

                    Container(
                      color: Colors.cyan,
                      height: 50.0,
                      child: Container(
                        height: 40.0,
                        child: FlatButton(
                          child: Text("Collection",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> EditPage2(contact: widget.contact)));
                          },
                        ),
                      ),
                    ),

                    Container(
                      color: Colors.cyanAccent,
                      height: 50.0,
                      child: Container(
                        height: 40.0,
                        child: FlatButton(
                          child: Text("Current Due",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                          onPressed: (){


                            widget.contact.due = (double.parse(widget.contact.rate)-double.parse(widget.contact.collection)).toString();


                            /*setState(() {
                                widget.contact.due = (double.parse(widget.contact.rate)-double.parse(widget.contact.collection)).toString();
                              });*/

                            //widget.contact.due = (double.parse(widget.contact.rate)-double.parse(widget.contact.collection)).toString();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
*/