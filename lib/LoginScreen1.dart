import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/RegisteredScreen.dart';

import 'HomeScreen.dart';

class LoginScreen1 extends StatefulWidget {
  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  TextEditingController _mobileno = TextEditingController();
  TextEditingController _password = TextEditingController();

  checklogin() async
  {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin"))
      {
        Navigator.of(context).pop();
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HomeScreen())
        );
      }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter your Mobile no.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                // controller: _mobileno,
                controller: _mobileno,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter the number"),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Enter your Password",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 18,
              ),
              TextField(
                controller: _password,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter the password"),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        var mobile = _mobileno.text.toString();
                        var pw = _password.text.toString();

                        _mobileno.text = "";
                        _password.text = "";


                        var s_mobile="";
                        var s_password="";

                        SharedPreferences prefs = await SharedPreferences.getInstance();

                        if(prefs.containsKey("Mobilenum") && prefs.containsKey("Pass"))
                          {
                            s_mobile = prefs.getString("Mobilenum");
                            s_password = prefs.getString("Pass");
                          }

                        if(mobile=="" && pw=="")
                        {
                          Fluttertoast.showToast(
                              msg: "Please enter mobile number and password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 20.0
                          );
                        }
                        else if(mobile==s_mobile && pw==s_password)
                        {
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          prefs.setString("islogin", "yes");


                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => HomeScreen())
                          );
                        }
                        else
                        {
                          Fluttertoast.showToast(
                              msg: "Invalid mobile number or password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 20.0
                          );
                        }

                      },
                      child: Text("Log In", style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 40,),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => RegisteredScreen())
                        );
                      },
                      child:Text("Create new Account"),
                    ),
                  ],
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
