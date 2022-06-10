import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginScreen1.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var Uname="";
  var Mobile="";
  var Pw="";
  var Mail="";

  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      Uname = prefs.getString("Name");
      Mobile = prefs.getString("Mobilenum");
      Pw = prefs.getString("Pass");
      Mail = prefs.getString("Mail");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
            child : Column(
              children: [
                SizedBox(height: 30,),
                Divider(
                  height: 20,
                  thickness: 3,
                  color: Colors.blueAccent,
                ),
                Text("Name :" + Uname , style: TextStyle(fontSize: 20),),
                Divider(
                  height: 20,
                  thickness: 3,
                  color: Colors.blueAccent,
                ),
                Text("Mobile number :" + Mobile, style: TextStyle(fontSize: 20),),
                Divider(
                height: 20,
                thickness: 3,
                color: Colors.blueAccent,
                ),
                Text("Password :" + Pw, style: TextStyle(fontSize: 20),),
                Divider(
                  height: 20,
                  thickness: 3,
                  color: Colors.blueAccent,
                ),
                Text("E-Mail :" + Mail, style: TextStyle(fontSize: 20),),
                Divider(
                  height: 20,
                  thickness: 3,
                  color: Colors.blueAccent
                  ,
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () async {

                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    prefs.remove("islogin");

                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=> LoginScreen1())
                    );
                  },
                  child: Text("Log out",style: TextStyle(fontSize: 20),),
                ),

              ],
            ),
          ),
      ),
    );
  }
}

