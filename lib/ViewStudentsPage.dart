import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'UpdateStudent.dart';
import 'helpers/DataBaseHelper.dart';

class ViewStudentsPage extends StatefulWidget {
  @override
  State<ViewStudentsPage> createState() => _ViewStudentsPageState();
}

class _ViewStudentsPageState extends State<ViewStudentsPage> {
  _createDialog(id) {
    AlertDialog alert = AlertDialog(
      title: Text("Are you Sure ?"),
      content: Text("Do you really want to delete permanently ?"),
      contentPadding: EdgeInsets.all(15.0),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(onPressed: () async {
                DataBaseHelper obj = new DataBaseHelper();
                int status = await obj.deletestudent(id);
                print("Status :"+status.toString());
                Navigator.of(context).pop();
                if(status==1)
                  {
                    print("Record Deleted");
                    Fluttertoast.showToast(
                        msg: "Record Deleted Permanently",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 20.0
                    );
                    getData();
                  }
                else
                  {
                    print("Error");
                  }
              }, child: Text("Yes")),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
            ),
          ],
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  Future<List> alldata;

  getData() async {
    DataBaseHelper obj = new DataBaseHelper();
    setState(() {
      alldata = obj.getAllStudent();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View students details"),
      ),
      body: FutureBuilder(
          future: alldata,
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              //  if data loaded
              if (snapshots.data.length <= 0) {
                return Center(child: Text("No data"));
              } else {
                return ListView.builder(
                    itemCount: snapshots.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 380.0,
                        color: Colors.amberAccent,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Divider(),
                            Text(
                              snapshots.data[index]["Name"].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Divider(),
                            Text(
                              snapshots.data[index]["Rollno"].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Divider(),
                            Text(
                              snapshots.data[index]["S1"].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Divider(),
                            Text(
                              snapshots.data[index]["S2"].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Divider(),
                            Text(
                              snapshots.data[index]["S3"].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Divider(),
                            Text(
                              snapshots.data[index]["Total"].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Divider(),
                            Text(
                              snapshots.data[index]["Percent"].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Divider(),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        var id = snapshots.data[index]["sid"].toString();
                                        _createDialog(id);
                                      }, child: Text("Delete")),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        var id = snapshots.data[index]["sid"].toString();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context)=>UpdateStudent(updateid: id))
                                        );
                                      },
                                      child: Text("Update")),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }
            } else {
              //  data not loaded
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
