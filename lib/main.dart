import 'package:flutter/material.dart';

import 'AddEmployeePage.dart';
import 'AddProductPage.dart';
import 'AddStudentPage.dart';
import 'AdditionExample.dart';
import 'BankCloneErrorPage.dart';
import 'BankCloneHomeScreen.dart';
import 'CreatePinExample.dart';
import 'EnterPinExample.dart';
import 'HomePage.dart';
import 'LoginScreen1.dart';
import 'HomeScreen.dart';
import 'RegisteredScreen.dart';
import 'SQFliteExample.dart';
import 'SharePreferencesExample.dart';
import 'ViewEmployeePage.dart';
import 'ViewProductPage.dart';
import 'ViewStudentsPage.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SQFliteExample(),
    );
  }
}


