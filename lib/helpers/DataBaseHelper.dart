import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper
{
  Database db;

  //Database Create
  Future<Database> create_db() async
  {
  //  database already exist
    if(db!=null)
      {
        return db;
      }
    else
      {
      //database create
        Directory dir = await getApplicationDocumentsDirectory();
        String path = join(dir.path,"shopdb");
        var db = await openDatabase(path,version: 1,onCreate: create_table);
        return db;
      }
  }
  create_table(Database db,int version) async
  {
  // create table
    db.execute("create table products (pid integer primary key autoincrement,pname text,pdesc text,rprice double,sprice double)");
    print("Table Create");
    db.execute("create table employee (eid integer primary key autoincrement,ename text,email text,econt text,egender text,edep text)");
    print("Table created");
    db.execute("create table student (sid integer primary key autoincrement,Name text,Rollno integer,S1 double,S2 double,S3 double,Total double,Percent double)");
    print("Table created");
  }

  Future<int> addproduct(name,pdesc,rprice,sprice) async
  {
    var db = await create_db();
    var id = await db.rawInsert("insert into products (pname,pdesc,rprice,sprice) values(?,?,?,?)",[name,pdesc,rprice,sprice]);
    return id;
  }

  Future<int> updateproduct(name,pdesc,rprice,sprice,updatePid) async
  {
    var db = await create_db();
    // var id = await db.rawInsert("insert into student (Name,Rollno,S1,S2,S3,Total,Percent) values(?,?,?,?,?,?,?)",[name,rollno,s1,s2,s3,total,percent]);
    var status= await db.rawUpdate("update products set pname=?,pdesc=?,rprice=?,sprice=? where pid=?",[name,pdesc,rprice,sprice,updatePid]);
    return status;
  }

  Future<int> addemployee(nm,mail,cont,_selectedGender,select) async
  {
    var db = await create_db();
    var id = await db.rawInsert("insert into employee (ename,email,econt,egender,edep) values(?,?,?,?,?)",[nm,mail,cont,_selectedGender,select]);
    return id;
  }

  Future<int> updateemployee(nm,mail,cont,_selectedGender,select,updateEid) async
  {
    var db = await create_db();
    // var id = await db.rawInsert("insert into student (Name,Rollno,S1,S2,S3,Total,Percent) values(?,?,?,?,?,?,?)",[name,rollno,s1,s2,s3,total,percent]);
    var status= await db.rawUpdate("update employee set ename=?,email=?,econt=?,egender=?,edep=? where eid=?",[nm,mail,cont,_selectedGender,select,updateEid]);
    return status;
  }

  Future<int> addstudent(name,rollno,s1,s2,s3,total,percent) async
  {
    var db = await create_db();
    var id = await db.rawInsert("insert into student (Name,Rollno,S1,S2,S3,Total,Percent) values(?,?,?,?,?,?,?)",[name,rollno,s1,s2,s3,total,percent]);
    return id;
  }

  Future<int> updatestudent(name,rollno,s1,s2,s3,total,percent,updateid) async
  {
    var db = await create_db();
    // var id = await db.rawInsert("insert into student (Name,Rollno,S1,S2,S3,Total,Percent) values(?,?,?,?,?,?,?)",[name,rollno,s1,s2,s3,total,percent]);
    var status= await db.rawUpdate("update student set Name=?,Rollno=?,S1=?,S2=?,S3=?,Total=?,Percent=? where sid=?",[name,rollno,s1,s2,s3,total,percent,updateid]);
    return status;
  }

  Future<List> getAllProducts() async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from products");
    return data.toList();
  }

  Future<List> getAllEmployee() async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from employee");
    return data.toList();
  }

  Future<List> getAllStudent() async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from student");
    return data.toList();
  }

  Future<int> deletestudent(id) async
  {
    var db = await create_db();
    var status = await db.rawDelete("delete from student where sid=?",[id]);
    return status;
  }

  Future<int> deleteproduct(id) async
  {
    var db = await create_db();
    var status = await db.rawDelete("delete from products where pid=?",[id]);
    return status;
  }

  Future<int> deleteemployee(id) async
  {
    var db = await create_db();
    var status = await db.rawDelete("delete from employee where eid=?",[id]);
    return status;
  }

  Future<List> getsingleproduct(id) async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from products where pid=?",[id]);
    return data.toList();
  }

  Future<List> getsingleemployee(id) async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from employee where eid=?",[id]);
    return data.toList();
  }

  Future<List> getsinglestudent(id) async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from student where sid=?",[id]);
    return data.toList();
  }

}