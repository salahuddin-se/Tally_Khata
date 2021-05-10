import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:tallykhata/secondPage.dart';
import 'package:tallykhata/total_cal.dart';
import 'How_to_use/Video.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.0),
        child: AppBar(
          title: Text('Tally Khata'),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12,),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: 335,
                  height: 180.0,
                  child: Carousel(
                      images: [
                        AssetImage('images/tally1.png'),
                        AssetImage('images/tally2.jpg'),
                        AssetImage('images/tally3.jpg'),
                        AssetImage('images/tally4.jpg'),

                      ],
                      autoplay: true,
                      dotSize: 0,
                      dotSpacing: 0,
                      //dotColor: Colors.lightGreenAccent,
                      indicatorBgPadding: 0,
                      //dotBgColor: Colors.purple.withOpacity(0.5),
                      borderRadius: false,
                      moveIndicatorFromBottom: 180.0,
                      overlayShadow: false,
                      autoplayDuration: const Duration(seconds: 4)
                  )
              ),
            ),

            Container(
              //width: 335,
              child: GridView.count(
                shrinkWrap: true,
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
                            SizedBox(height: 15,),
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
                            SizedBox(height: 15,),
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
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CalTot()));
                      },
                      child: Container(
                        color: Colors.white,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15,),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => VideoDemo()));
                      },

                      child: Container(
                        color: Colors.white,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15,),
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


                  /*Padding(
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
                  ),*/


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
