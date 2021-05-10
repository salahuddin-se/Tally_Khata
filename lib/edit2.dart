import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tallykhata/helpers/database_helper.dart';
import 'main.dart';
import 'secondPage.dart';
//import 'package:bakirkhata/lib/details.dart';
import 'package:tallykhata/models/contact.dart';

// ignore: must_be_immutable
class EditPage2 extends StatefulWidget {
  Contact contact;
  EditPage2({Key key, this.contact}) : super(key: key);
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage2> {

  double res3 = 0;

  var textEditingControllerCollection = new TextEditingController();
  var textEditingControllerTotal = new TextEditingController();


  @override
  Widget build(BuildContext context) {


    textEditingControllerCollection.text=widget.contact.collection;



    return Scaffold(
        backgroundColor: Colors.lime[50],
        appBar: AppBar(
          title: Text("Collection",style: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.bold)),
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


                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Collect(TK)",labelStyle: TextStyle(
                    color: Colors.lightBlue, // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                    hintText: "Collect(TK)",hintStyle: TextStyle(
                    color: Colors.lightBlue, // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
                  controller: textEditingControllerCollection,
                ),


                SizedBox(
                  height: 50.0,
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Container(
                      color: Colors.cyan,
                      height: 50.0,
                      child: Container(
                        child: FlatButton(
                          child: Text("Save",style: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.bold)),
                          onPressed: () async {

                            /*String ress = widget.contact.collection;
                            var res =  double.parse(ress);
                            res1 = res + double.parse(textEditingControllerCollection.text);
                            widget.contact.collection=res1.toString();*/

                            String ress5 = widget.contact.collection;
                            var res2 =  double.parse(ress5);
                            res3 = res2 + double.parse(textEditingControllerCollection.text);
                            widget.contact.collection=res3.toString();


                            var db = DatabaseHelper();
                            await db.update(widget.contact);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp2()));
                            //Navigator.pop(context, MaterialPageRoute(builder: (context)=> MyApp2()));
                          },
                        ),
                      ),
                    ),
                    //Padding(padding: EdgeInsets.only(left: 5,right: 5)),

                    Container(
                      color: Colors.cyan,
                      height: 50.0,
                      child: Container(
                        child: FlatButton(
                          child: Text("Cancel",style: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.bold)),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp2()));
                          },
                        ),
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),

    );
  }
}
