import 'package:flutter/material.dart';
import 'package:sqlite/BL/UserMethod.dart';

import 'EditList.dart';

class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListScreen();
  }
}

class _ListScreen extends State<ListScreen> {
  List Users = new List();
  void refresh() {
    UserMethod.GetAllUser().then((vals) {
      setState(() {
        Users = vals;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    refresh();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Base"),
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            new Expanded(
                child: ListView.builder(

                  itemCount:Users.length,
                itemBuilder: (BuildContext context, int position) {
              return new Card(
                child: new ListTile(
                  title: new Text(Users[position]["UserName"]),
                  trailing: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(onPressed: (){
                        UserMethod.Delete(Users[position]["IdUSER"]);
                        refresh();
                      },
                      icon: Icon(Icons.delete),)
                    ],
                  ),
                ),
              );
            }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditList("add", "", "")));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
