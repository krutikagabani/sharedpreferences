import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/LoginScreen1.dart';

import 'HomeScreen.dart';

class RegisteredScreen extends StatefulWidget {

  @override
  State<RegisteredScreen> createState() => _RegisteredScreenState();
}

class _RegisteredScreenState extends State<RegisteredScreen> {
  TextEditingController _username = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();


  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regestered Page"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Username",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                 TextFormField(
                   controller: _username,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Username"),
                   validator: (val)
                   {
                     if(val.isEmpty)
                     {
                       return "Please Enter Username";
                     }
                     return null;
                   },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter your mobile number",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _mobile,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Mobile number"),
                  validator: (val)
                  {
                    if(val.length<=0)
                      {
                        return "Please enter your mobile number";
                      }
                    else if(val.length!=10)
                      {
                        return "Please Enter Valid mobile number";
                      }
                    else
                    {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter your Password",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Password"),
                  validator: (val)
                  {
                    if(val.isEmpty)
                      {
                        return "Please Enter Password";
                      }
                    else if(val.length<=6)
                    {
                      return "Please Enter min 6 charecters";
                    }
                    else{
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Enter your Email",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 18,
                ),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email Address"),
                  validator: (val)
                  {
                    if(val.length<=0 || val.isEmpty)
                    {
                      return "Please Enter your Email";
                    }
                    else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(val))
                    {
                      return "Pleasr Enter Valid Email";
                    }
                    else{
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 40,),
                      ElevatedButton(
                        onPressed: () async {
                          if(formkey.currentState.validate())
                          {
                            var Uname = _username.text.toString();
                            var Mobile = _mobile.text.toString();
                            var Pw = _password.text.toString();
                            var Mail = _email.text.toString();

                            print("UserName : "+Uname);
                            print("Mobile Number : "+Mobile);
                            print("Password : "+Pw);
                            print("Email ADD : "+Mail);

                            SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            prefs.setString("Name", Uname);
                            prefs.setString("Mobilenum", Mobile);
                            prefs.setString("Pass", Pw);
                            prefs.setString("Mail", Mail);


                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => LoginScreen1())
                            );
                          }
                        },
                        child: Text("Registered"),
                      ),
                    ],
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
