import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharedpreferences/helpers/DataBaseHelper.dart';

import 'UpdateProduct.dart';
import 'UpdateStudent.dart';

class ViewProductPage extends StatefulWidget {
  @override
  State<ViewProductPage> createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
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
              child: ElevatedButton(
                  onPressed: () async {
                    DataBaseHelper obj = new DataBaseHelper();
                    int status = await obj.deleteproduct(id);
                    print("Status :" + status.toString());
                    Navigator.of(context).pop();
                    if (status == 1) {
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
                      getdata();
                    } else {
                      print("Error");
                    }
                  },
                  child: Text("Yes")),
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

  getdata() async {
    DataBaseHelper obj = new DataBaseHelper();
    setState(() {
      alldata = obj.getAllProducts();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Products"),
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
                        height: 200.0,
                        color: Colors.amberAccent,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Divider(),
                            Text(snapshots.data[index]["pname"].toString()),
                            Divider(),
                            Text(snapshots.data[index]["pdesc"].toString()),
                            Divider(),
                            Text(snapshots.data[index]["sprice"].toString()),
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
                                        var id = snapshots.data[index]["pid"]
                                            .toString();
                                        _createDialog(id);
                                      },
                                      child: Text("Delete")),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        var id = snapshots.data[index]["pid"]
                                            .toString();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateProduct(
                                                        updatePid: id)));
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

                      // return ListTile(
                      //   title: Text(snapshots.data[index]["pname"].toString()),
                      //   subtitle : Text(snapshots.data[index]["pdesc"].toString()),
                      //   trailing:  Text(snapshots.data[index]["sprice"].toString()),
                      //
                      // );
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
