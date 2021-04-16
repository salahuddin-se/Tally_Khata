import 'package:flutter/material.dart';
import 'package:tallykhata/secondPage.dart';
import 'add.dart';


void main()=> runApp(
    MaterialApp(
      home: Dash(),
      //title: "ListView",
      debugShowCheckedModeBanner: false,
    )
);

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.cyan[50] ,
      appBar: AppBar(
        title: Text('Tally Khata',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xFF00E676),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.count(

          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[

            Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPage()));
                },
                child: Container(
                  color: Colors.white,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 30.0,
                            child: Image.asset("images/pict1.jpg"),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("Add Customer",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),)
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),


            Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp2()));
                },
                child: Container(
                  color: Colors.white,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 30.0,
                            child: Image.asset("images/pict2.jpg"),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("List Of Customer",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),)
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),


            Card(
              child: InkWell(
                /*onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CalTot()));
                },*/
                child: Container(
                  color: Colors.white,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 30.0,
                            child: Image.asset("images/pic3.jpg"),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("Total Calculation",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),)
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),


            Card(
              child: InkWell(
                onTap: () {
                 /* Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPage()));*/
                },

                child: Container(
                  color: Colors.white,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 30.0,
                            child: Image.asset("images/pic4.jpg"),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("How to use ?",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),)
                        ),
                      )

                    ],
                  ),
                ),

              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top:70),
              child: Card(
                child: InkWell(
                  onTap: () {
                    //Navigator.push(context,
                        //MaterialPageRoute(builder: (context) => Second()));
                  },
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Review",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                      ),
                    ),
                    height: 10.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top:70),
              child: Card(
                child: InkWell(
                  onTap: () {
                    //Navigator.push(context,
                        //MaterialPageRoute(builder: (context) => Second()));
                  },
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Log Out",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                      ),
                    ),
                    height: 10.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
