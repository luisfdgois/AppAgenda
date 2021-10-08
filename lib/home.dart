import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/AnnotationRepository.dart';
import 'package:projeto_agenda/views/annotations_listview/annotation_tile.dart';
import 'package:projeto_agenda/models/Annotation.dart';
import 'package:projeto_agenda/views/annotations_listview/annotations_list.dart';
import 'package:projeto_agenda/views/calendar_table.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isChecked = false;

  final categoryList = ["Meetings", "Gym", "Work", "College"];
  String chosenCategory = "Meetings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agenda"),
          backgroundColor: Color(0xff0884CA),
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 100
          ),
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
              _filters(),
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

  Widget _filters(){
    return Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text("Filters:", style: TextStyle(fontSize: 15),),
            ),
            Expanded(
              flex: 1,
              child: Checkbox(
                checkColor: Colors.white,
                value: isChecked,
                shape: CircleBorder(),

                onChanged: (bool? value) => {
                  setState(() {
                    isChecked = value!;
                  })
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: Text("Notifiable", style: TextStyle(fontSize: 15),),
            ),
            Container(
                child: DropdownButton(

                  hint: Text("Categories"),
                  value: chosenCategory,
                  underline: SizedBox(),
                  iconSize: 35,
                  onChanged: (String? newChoice) {
                    setState(() {
                      chosenCategory = newChoice!;
                    });
                    },
                  items: categoryList.map((String category) =>
                      DropdownMenuItem<String>(
                          value: category,
                          child: Text(category, style: TextStyle(fontSize: 16)))
                  ).toList(),
                )
            )
          ],
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
