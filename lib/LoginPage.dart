import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mobileno = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text("Mobile number",
                  style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _mobileno,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your mobile number"),
                ),
                SizedBox(height: 40,),
                Text("Password",
                  style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your mobile number"),
                ),
                SizedBox(height: 100,),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text("Log in",
                        style: TextStyle(fontSize: 20),),
                    ),
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
