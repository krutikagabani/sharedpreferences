import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharedpreferences/ViewProductPage.dart';

import 'helpers/DataBaseHelper.dart';

class UpdateProduct extends StatefulWidget {
  var updatePid="";

  UpdateProduct({this.updatePid});


  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController _name = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _rprice = TextEditingController();
  TextEditingController _sprice = TextEditingController();

  getsingledata() async
  {
    DataBaseHelper obj = new DataBaseHelper();
    var data = await obj.getsingleproduct(widget.updatePid);
    setState(() {
      _name.text = data[0]["pname"].toString();
      _desc.text = data[0]["pdesc"].toString();
      _rprice.text = data[0]["rprice"].toString();
      _sprice.text = data[0]["sprice"].toString();
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
          title: Text("Update Product page"),
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
                        "Description :",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _desc,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Product Description",
                        ),
                        maxLines: 5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "R price :",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _rprice,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "R price",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "S price :",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _sprice,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "S price",
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
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: ElevatedButton(
                                onPressed: () async {
                                  var name = _name.text.toString();
                                  var pdesc = _desc.text.toString();
                                  var rprice = _rprice.text.toString();
                                  var sprice = _sprice.text.toString();

                                  // DataBaseHelper obj = new DataBaseHelper();
                                  // var id = await obj.addproduct(
                                  //     name, pdesc, rprice, sprice);
                                  // print("Record inserted at :" + id.toString());

                                  DataBaseHelper obj = new DataBaseHelper();
                                  var status = await obj.updateproduct(name,pdesc,rprice,sprice,widget.updatePid);
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => ViewProductPage())
                                  // _name.text = "";
                                  // _desc.text = "";
                                  // _rprice.text = "";
                                  // _sprice.text = "";
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
        ));
  }
}
