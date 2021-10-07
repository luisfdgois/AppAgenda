import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/Annotations.dart';
import 'package:projeto_agenda/AnnotationTile.dart';
import 'package:projeto_agenda/models/Annotation.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final annotations = {...dummy_anotations}.values.toList();
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
              _calendar(),
              _divider(),
              _filters(),
              _registrationList(annotations)
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

Widget _calendar() {
  return Container(
      child: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime(2000, 1, 1),
        lastDay: DateTime(2030, 12, 31),

        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
              fontSize: 17,
              locale: Locale('pt', 'BR')
          ),
        ),

        calendarStyle: CalendarStyle(
            canMarkersOverflow: true,
            todayDecoration: BoxDecoration(
                color: Color(0xff7FBCDE),
                shape: BoxShape.circle)
        ),

        rowHeight: 48,
        daysOfWeekStyle: DaysOfWeekStyle(
            weekendStyle: TextStyle(color: Colors.deepOrangeAccent)
        ),
      )
  );
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

Widget _registrationList(List<Annotation> annotations) {
  return Expanded(
      child: ListView.builder(
          itemCount: dummy_anotations.length,
          itemBuilder: (context, index) =>
              AnnotationTile(annotations.elementAt(index)))
  );
}
