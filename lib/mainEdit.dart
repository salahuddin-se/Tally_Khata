import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'secondPage.dart';
import 'package:tallykhata/helpers/database_helper.dart';
import 'package:tallykhata/models/contact.dart';

// ignore: must_be_immutable
class EditPage3 extends StatefulWidget {
  Contact contact;
  EditPage3({Key key, this.contact}) : super(key: key);
  @override
  _EditPageState3 createState() => _EditPageState3();
}

class _EditPageState3 extends State<EditPage3> {

  double res1 = 0,res2=0;

  var textEditingControllerName = new TextEditingController();
  var textEditingControllerVillage = new TextEditingController();
  var textEditingControllerPhone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    textEditingControllerName.text=widget.contact.name;
    textEditingControllerVillage.text=widget.contact.village;
    textEditingControllerPhone.text=widget.contact.phone;



    return Scaffold(
          backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Edit Contact",style: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.bold)),
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
                    labelText: 'Name',labelStyle: TextStyle(
                    color: Colors.lightBlue, // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                    hintText: "Name",hintStyle: TextStyle(
                    color: Colors.lightBlue, // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
                  controller: textEditingControllerName,
                ),

                SizedBox(
                  height: 20.0,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',labelStyle: TextStyle(
                    color: Colors.lightBlue, // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                    hintText: "Address",hintStyle: TextStyle(
                    color: Colors.lightBlue, // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
                  controller: textEditingControllerVillage,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',labelStyle:TextStyle(
                    color: Colors.lightBlue, // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                    hintText: "Phone",hintStyle: TextStyle(
                    color: Colors.lightBlue, // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
                  controller: textEditingControllerPhone,
                ),


                SizedBox(
                  height: 60.0,
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right:20.0),
                      child: Container(
                        child: RaisedButton(
                          color: Colors.lightBlueAccent,
                          child: Text("Save",style: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.bold)),
                          onPressed: () async {


                            widget.contact.name=textEditingControllerName.text;
                            widget.contact.village=textEditingControllerVillage.text;
                            widget.contact.phone=textEditingControllerPhone.text;


                            var db = DatabaseHelper();
                            await db.update(widget.contact);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp2()));
                          },
                        ),
                      ),
                    ),
                    //Padding(padding: EdgeInsets.only(left: 5,right: 5)),
                    Padding(
                      padding: const EdgeInsets.only(right:20.0),
                      child: Container(
                        child: RaisedButton(
                          color: Colors.lightBlueAccent,
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
