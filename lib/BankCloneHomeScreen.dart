import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'EnterPinExample.dart';

class BankCloneHomeScreen extends StatefulWidget {
  @override
  State<BankCloneHomeScreen> createState() => _BankCloneHomeScreenState();
}

class _BankCloneHomeScreenState extends State<BankCloneHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          child: Ink(
            decoration: ShapeDecoration(
              color: Colors.red,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.power_settings_new_outlined,
              ),
              color: Colors.white,
              onPressed: () async {

                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EnterPinExample())
                );
                print("You Pressed the icon!");
              },
            ),
          ),
        ),
      )),
    );
  }
}
