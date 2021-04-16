import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tallykhata/helpers/database_helper.dart';
import 'secondPage.dart';
import 'package:tallykhata/models/contact.dart';

// ignore: must_be_immutable
class EditPage extends StatefulWidget {
  Contact contact;
  EditPage({Key key, this.contact}) : super(key: key);
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  double res1 = 0,res2=0,fi=0;


  var textEditingControllerRate = new TextEditingController();
  var textEditingControllerTotal = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    textEditingControllerRate.text=widget.contact.rate;
    textEditingControllerTotal.text=widget.contact.total;



    return MaterialApp(
      theme: ThemeData(
        //primaryColor: Color(0xFF12a644),
          primaryColor: Colors.cyanAccent[100]
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lime[50],
        appBar: AppBar(
          title: Text("Save Due",style: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.bold)),
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

                /*TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Rate(TK)",hintStyle: TextStyle(
                    color: Colors.greenAccent[400], // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
                  controller: textEditingControllerRate,
                ),*/

                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Add Due(TK)",
                    hintText: "Add Due(TK)",hintStyle: TextStyle(
                    color: Colors.black, // <-- Change this
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
                  controller: textEditingControllerRate,
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

                            String ress = widget.contact.rate;
                            var res =  double.parse(ress);
                            res1 = res + double.parse(textEditingControllerRate.text);
                            widget.contact.rate=res1.toString();

                            var db = DatabaseHelper();
                            await db.update(widget.contact);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp2()));
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
      ),
    );
  }
}
