import 'package:flutter/material.dart';
import 'package:sqlite/BL/UserMethod.dart';
import 'package:sqlite/Model/User.dart';
class EditList extends StatefulWidget{
  String command1 ;
  String name1;
  String password1;
  EditList(this.command1 , this.name1 ,this.password1);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditList(command1 , name1 ,password1);
  }


}

TextEditingController name = new TextEditingController();
TextEditingController password = new TextEditingController();

class _EditList extends State<EditList>{
  String command1 ;
  String name1;
  String password1;
  _EditList(this.command1 , this.name1 ,this.password1);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Edit List"),  ) ,
      body: new Container(
        child: Column(
          children: <Widget>[
            new TextField( controller: name,
            ),
            new TextField( controller: password,
            ),
            new RaisedButton(onPressed: (){
              if(name.text.length > 0 && password.text.length>0){
                if(command1=="add"){
                  UserMethod.addUser(new User(0,name.text,password.text));
                  name.text="";
                  password.text="";
                  Navigator.pop(context);
                }
              }
            } , child: new Text("Done "),
            )
          ],
        ),

      ),


    );
  }


}