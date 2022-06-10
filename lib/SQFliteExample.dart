import 'package:flutter/material.dart';
import 'package:sharedpreferences/AddEmployeePage.dart';
import 'package:sharedpreferences/AddStudentPage.dart';
import 'package:sharedpreferences/UpdateProduct.dart';
import 'package:sharedpreferences/UpdateStudent.dart';
import 'package:sharedpreferences/ViewEmployeePage.dart';
import 'package:sharedpreferences/ViewProductPage.dart';
import 'package:sharedpreferences/ViewStudentsPage.dart';

import 'AddProductPage.dart';
import 'UpdateEmployee.dart';

class SQFliteExample extends StatefulWidget {

  @override
  State<SQFliteExample> createState() => _SQFliteExampleState();
}

class _SQFliteExampleState extends State<SQFliteExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SqfLite Example"),
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
              leading: Icon(Icons.add_shopping_cart_outlined, size: 30.0,),
              title: Text("Add Product page", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>AddProductPage())
                );
              },
            ),
            Divider(),

            ListTile
              (
              leading: Icon(Icons.shopping_cart_outlined, size: 30.0,),
              title: Text("View Product page", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewProductPage())
                );
              },
            ),
            Divider(),

            ListTile
              (
              leading: Icon(Icons.add_shopping_cart_outlined, size: 30.0,),
              title: Text("Update Product page", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>UpdateProduct())
                );
              },
            ),
            Divider(),

            ListTile
              (
              leading: Icon(Icons.person_add_alt, size: 30.0,),
              title: Text("Add Employee page", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>AddEmployeePage())
                );
              },
            ),
            Divider(),
            ListTile
              (
              leading: Icon(Icons.person, size: 30.0,),
              title: Text("View Employee page", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewEmployeePage())
                );
              },
            ),
            Divider(),
            ListTile
              (
              leading: Icon(Icons.person_add_alt, size: 30.0,),
              title: Text("Update Employee", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>UpdateEmployee())
                );
              },
            ),
            Divider(),
            ListTile
              (
              leading: Icon(Icons.person_add_alt, size: 30.0,),
              title: Text("Add student page", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>AddStudentPage())
                );
              },
            ),
            Divider(),
            ListTile
              (
              leading: Icon(Icons.person, size: 30.0,),
              title: Text("View Student page", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewStudentsPage())
                );
              },
            ),
            Divider(),
            ListTile
              (
              leading: Icon(Icons.person_add_alt, size: 30.0,),
              title: Text("Update Student page", style: TextStyle(fontSize: 18.0),),
              trailing: Icon(Icons.double_arrow_outlined, size: 25.0,),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>UpdateStudent())
                );
              },
            ),
            Divider(),
          ],
        ),
      ),

      body: Center(
        child: Text("This is SQFLite Example", style: TextStyle(fontSize: 25.0),),
      ),
    );
  }
}
