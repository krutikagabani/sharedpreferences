import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharedpreferences/ViewStudentsPage.dart';

import 'helpers/DataBaseHelper.dart';

class UpdateStudent extends StatefulWidget {
var updateid="";

UpdateStudent({this.updateid});

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {

  TextEditingController _name = TextEditingController();
  TextEditingController _rollno = TextEditingController();
  TextEditingController _s1 = TextEditingController();
  TextEditingController _s2 = TextEditingController();
  TextEditingController _s3 = TextEditingController();

  getsingledata() async
  {
    DataBaseHelper obj = new DataBaseHelper();
    var data = await obj.getsinglestudent(widget.updateid);
    setState(() {
      _name.text = data[0]["Name"].toString();
      _rollno.text = data[0]["Rollno"].toString();
      _s1.text = data[0]["S1"].toString();
      _s2.text = data[0]["S2"].toString();
      _s3.text = data[0]["S3"].toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsingledata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update student"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Name :",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _name,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your name",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Roll number :",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _rollno,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enyter your roll num",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Subject 1 :",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _s1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "sub 1",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Subject 2 :",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _s2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Sub 2",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Subject 3 :",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _s3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Sub 3",
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/2.2,
                            child: ElevatedButton(
                              onPressed : () async {

                                var Name = _name.text.toString();
                                var Rollno = _rollno.text.toString();
                                var S1 = _s1.text.toString();
                                var S2 = _s2.text.toString();
                                var S3 = _s3.text.toString();
                                var Total = double.parse(S1) + double.parse(S2) +double.parse(S3);
                                var Percent = Total/3;

                                DataBaseHelper obj = new DataBaseHelper();
                                var status = await obj.updatestudent(Name,Rollno,S1,S2,S3,Total,Percent,widget.updateid);
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => ViewStudentsPage())
                                );

                                Fluttertoast.showToast(
                                    msg: "Record Updated Successfully",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 20.0
                                );
                                // print("Record inserted at :"+id.toString());

                                // _name.text="";
                                // _rollno.text="";
                                // _s1.text="";
                                // _s2.text="";
                                // _s3.text="";
                              },
                              child: Text("Update"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
