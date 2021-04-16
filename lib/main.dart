import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashBoard.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {

  // ignore: non_constant_identifier_names
  final username_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final password_controller = TextEditingController();
  SharedPreferences logindata;
  bool newuser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  // ignore: non_constant_identifier_names
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Dash()));
    }
  }
  @override
  void dispose() {

    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tally Khata',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top:25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    " Tally Khata Login Form",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: username_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: 'username',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: password_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),

                SizedBox(
                  height: 25.0,
                ),

                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.cyan,
                  onPressed: () {
                    String username = username_controller.text;
                    String password = password_controller.text;
                    if (username != '' && password != '') {
                      print('Successfull');
                      logindata.setBool('login', false);
                      logindata.setString('username', username);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dash()));
                    }
                  },
                  child: Text("Log-In",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}