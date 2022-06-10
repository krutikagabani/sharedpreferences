import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharedpreferences/helpers/DataBaseHelper.dart';

class AddProductPage extends StatefulWidget {
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _rprice = TextEditingController();
  TextEditingController _sprice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Products"),
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
                            width: MediaQuery.of(context).size.width/2.2,
                            child: ElevatedButton(
                              onPressed : () async {

                                var name = _name.text.toString();
                                var pdesc = _desc.text.toString();
                                var rprice = _rprice.text.toString();
                                var sprice = _sprice.text.toString();

                                DataBaseHelper obj = new DataBaseHelper();
                                var id = await obj.addproduct(name,pdesc,rprice,sprice);
                                print("Record inserted at :"+id.toString());

                                Fluttertoast.showToast(
                                    msg: "Record inserted Successfully",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 20.0
                                );

                                _name.text="";
                                _desc.text="";
                                _rprice.text="";
                                _sprice.text="";
                              },
                              child: Text("ADD"),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2.2,
                            child: ElevatedButton(
                              onPressed : (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel"),
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
