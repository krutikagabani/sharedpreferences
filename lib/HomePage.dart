import 'package:flutter/material.dart';

import 'LoginPage.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: Icon(Icons.menu_open),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Text("K", style: TextStyle(fontSize: 30.0),),
              ),
              accountName: Text("Kesar Gabani",style: TextStyle(fontSize: 20),),
              accountEmail: Text("kesar1234@gmail.com",style: TextStyle(fontSize: 15),),
            ),

            ListTile
              (
              leading: Icon(Icons.login_outlined, size: 30.0,),
              title: Text("Login page", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>LoginPage())
                );
              },
            ),
            Divider(),

            ListTile
              (
              leading: Icon(Icons.account_box, size: 30.0,),
              title: Text("Registration page", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){},
            ),
            Divider(),

            ListTile
              (
              leading: Icon(Icons.person_add_alt, size: 30.0,),
              title: Text("About page", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){},
            ),
            Divider(),
            ListTile
              (
              leading: Icon(Icons.phone, size: 30.0,),
              title: Text("Contact page", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){},
            ),
            Divider(),
          ],
        ),
      ),

    );
  }
}
