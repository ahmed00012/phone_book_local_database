
import 'dart:core';


import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class DaataBaseHelper {

  static Database db;

  static  Future<Database> getdb() async{
    if (db != null)
      return db;
    else {
      db = await OpenDb();
      return db;
    }

  }


  static Future<Database> OpenDb() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path =join(dir.path,'Userdb.db');
    var Userdb= await openDatabase(path,version: 1 ,onCreate: _FirstCreate);

    return Userdb;
  }

  static Future restart() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path =join(dir.path,'Userdb.db');
    File f = new File(path);
    if(!f.existsSync()){
      deleteDatabase(path);
      print("DataBase Deleted");

    }



  }


  static void _FirstCreate(Database db , int version) async{
    var CreateUserTableStatement = " create table user(IdUSER INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , UserName Text ,Password Text )";

    await db.execute(CreateUserTableStatement);


  }


  static Future<void> CloseDb() async{
    var db = await getdb();
    db.close();
    db=null;
  }
}
