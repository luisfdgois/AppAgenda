import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_agenda/views/annotations_filters.dart';
import 'package:projeto_agenda/views/annotations_listview/annotations_list.dart';
import 'package:projeto_agenda/views/calendar_table.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agenda"), backgroundColor: Color(0xff0884CA), centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 100),
          actions: <Widget>[
            IconButton(
                onPressed: () => {},
                icon: Icon(Icons.menu_outlined, size: 30,))
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 75.0),
          child: Column(
            children: [
              CalendarTable(),
              _divider(),
              AnnotationFilters(),
              AnnotationList()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () => {},
        )
    );
  }
}

Widget _divider() {
  return Container(
    padding: EdgeInsets.all(5),
    child: Divider(
      color: Colors.black,
      height: 5,
    ),
  );
}
