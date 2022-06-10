import 'package:flutter/material.dart';

class BankCloneErrorPage extends StatefulWidget {

  @override
  State<BankCloneErrorPage> createState() => _BankCloneErrorPageState();
}

class _BankCloneErrorPageState extends State<BankCloneErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error Page"),
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text("Invalid Pin ... Please Uninstall the App", style: TextStyle(fontSize: 18),),
        ),
      ),
    );
  }
}
