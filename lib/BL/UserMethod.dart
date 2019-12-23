import 'package:sqlite/Model/User.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/DAL/DataBaseHelper.dart';
class UserMethod{

  static Future<int> addUser(User user ) async{
    Database mydb= await DaataBaseHelper.getdb();
    Map<String,dynamic> Usermap= new Map()  ;
    Usermap["UserName"]= user.name;
    Usermap["password"]= user.password;
    mydb.insert("User", Usermap);


  }

  static Future<List> GetAllUser() async{
    Database mydatabase= await DaataBaseHelper.getdb();
    List User = await mydatabase.rawQuery("Select * FROM USER");
    return User.toList();

  }


 static Future<int> Delete(int IdUser) async{
    Database mydatabase =await DaataBaseHelper.getdb();
   int result=await mydatabase.delete("USER", where : "IdUSER=${IdUser}");
return result;
  }



  Future<int> EditUser(User old) async{
    Database mydatabase =await DaataBaseHelper.getdb();
    Map<String , dynamic> newUser =new Map();
    newUser["IdUSER"]=old.id.toString();
    newUser["UserName"]="Ahmed";
    newUser["Password"]="1235";
    int result = await mydatabase.update("USER", newUser);

    return result;

  }


}