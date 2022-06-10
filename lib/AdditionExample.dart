import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdditionExample extends StatefulWidget {

  @override
  State<AdditionExample> createState() => _AdditionExampleState();
}

class _AdditionExampleState extends State<AdditionExample> {
  TextEditingController _n1 = TextEditingController();
  TextEditingController _n2 = TextEditingController();
  var result="0";
  var sum=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADdition example"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(10.0),
          child :Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text("Number 1 : ",style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),
              TextField(
                controller: _n1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 20,),
              Text("Number 2 : ",style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),
              TextField(
                controller: _n2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 40,),
              Center(
                child : ElevatedButton(
                  onPressed: () async {
                    var num1 = _n1.text.toString();
                    var num2 = _n2.text.toString();
                    setState(() {
                      sum = int.parse(num1) + int.parse(num2);
                      result = sum.toString();

                      print("Answer :" +result);
                    });

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString("Addition", result);

                    print("Value Stored in Shared Prefs");

                    _n1.text="";
                    _n2.text="";
                  },
                  child: Text("Add"),
                ),
              ),
              SizedBox(height: 20,),
              Text("Answer :" +result.toString(), style: TextStyle(fontSize: 20),),

              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();

                      if(prefs.containsKey("Addition"))
                      {
                        var total = prefs.getString("Addition");
                        // print("Value : "+total.toString());
                        setState(() {
                          result=total;
                        });
                      }
                      else
                      {
                        print("No Value Available");
                      }
                    },
                    child: Text("Last read"),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();

                      if(prefs.containsKey("Addition"))
                      {
                        // prefs.clear(); //all value
                        prefs.remove("Addition");
                        print("Value Removed From Storage");

                        setState(() {
                          result="Value Removed From Storage";
                        });
                      }
                      else
                      {
                        setState(() {
                          result="No Value Available";
                        });
                      }
                    },
                    child: Text("Remove"),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
