import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tallykhata/helpers/database_helper.dart';
import 'package:tallykhata/models/contact.dart';
import 'dashBoard.dart';

//import 'main.dart';
class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  double res1 = 0,res2=0;

  var textEditingControllerName = new TextEditingController();
  var textEditingControllerVillage = new TextEditingController();
  var textEditingControllerPhone = new TextEditingController();
  var textEditingControllerQty = new TextEditingController();
  var textEditingControllerRate = new TextEditingController();
  var textEditingControllerTotal = new TextEditingController();
  var textEditingControllerCollection = new TextEditingController();
  var textEditingControllerDue = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primaryColor: Color(0xFF12a644),
          primaryColor: Colors.cyan[600]

      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Colors.lime[50],
        backgroundColor: Colors.cyan[50],
        appBar: AppBar(
          title: Text("Add Contact",style: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.fromLTRB(25,10,25,10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Customer Name',
                    hintText: "Customer's Name",hintStyle: TextStyle(
                    color: Colors.black, // <-- Change this
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
                    labelText: 'Address',
                    hintText: "Address",hintStyle: TextStyle(
                    color: Colors.black, // <-- Change this
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
                    labelText: 'Phone',
                    hintText: "Phone",hintStyle: TextStyle(
                    color: Colors.black, // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
                  controller: textEditingControllerPhone,
                ),

                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add Due (Tk)',
                    hintText: "Add Due (Tk)",hintStyle: TextStyle(
                    color: Colors.black, // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
                  controller: textEditingControllerRate,
                ),



                SizedBox(
                  height: 20.0,
                ),


                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Collection(TK)",
                    hintText: "Collection(TK)",hintStyle: TextStyle(
                    color: Colors.black, // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
                  controller: textEditingControllerCollection,
                ),


                SizedBox(
                  height: 10.0,
                ),

                SizedBox(
                  height: 10.0,
                ),

                SizedBox(
                  height: 10.0,
                ),


                SizedBox(
                  height: 50.0,
                ),


                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50.0,
                        color: Colors.cyan[600],
                        child: RaisedButton(
                          child: Text("Save",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold)),
                          onPressed: () async {

                            var contact = new Contact(
                              name: textEditingControllerName.text,
                              village: textEditingControllerVillage.text,
                              phone: textEditingControllerPhone.text,
                              rate: textEditingControllerRate.text,
                              collection: textEditingControllerCollection.text,
                              due: textEditingControllerDue.text,

                            );

                            var db = DatabaseHelper();
                            await db.create(contact);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Dash()));
                          },
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5,right: 5)),
                    Expanded(
                        child: Container(
                          height: 50.0,
                          color: Colors.cyan[600],
                          child: RaisedButton(
                            child: Text("Cancel",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold)),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Dash()));
                            },
                          ),
                        )
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}