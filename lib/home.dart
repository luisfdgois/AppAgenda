import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/query_filters/GetAnnotationsParam.dart';
import 'package:projeto_agenda/views/annotations_floating.dart';
import 'package:projeto_agenda/views/annotations_listview/annotations_list.dart';
import 'package:projeto_agenda/views/calendar/calendar_components.dart';
import 'package:projeto_agenda/views/menu.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:projeto_agenda/data/DataBase.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final categories = {...dummy_categories}.values.toList();
  GetAnnotationsParam param = GetAnnotationsParam(DateTime.now(), null, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agenda"),
          backgroundColor: Color(0xff0884CA),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 100),
          actions: <Widget>[
            IconButton(
                onPressed: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MenuList()))
                    },
                icon: Icon(Icons.menu_outlined, size: 30))
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 75.0),
          child: Column(
            children: [
              _calendarTable(),
              _divider(),
              _filters(),
              AnnotationList(param)
            ],
          ),
        ),
        floatingActionButton: AnnotationFloating());
  }

  Widget _calendarTable() {
    return Container(
        child: TableCalendar(
      focusedDay: param.selectedDate,
      currentDay: DateTime.now(),
      firstDay: DateTime(2000, 1, 1),
      lastDay: DateTime(2030, 12, 31),
      headerStyle: CalendarComponents().headerStyle,
      calendarStyle: CalendarComponents().calendarStyle,
      rowHeight: 48,
      daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: TextStyle(color: Colors.deepOrangeAccent)),
      onDaySelected: (selectedDay, _) {
        setState(() {
          param.selectedDate = selectedDay;
        });
      },
      selectedDayPredicate: (date) {
        return isSameDay(param.selectedDate, date);
      },
    ));
  }

  Widget _divider() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Divider(color: Colors.black, height: 5),
    );
  }

  Widget _filters() {
    return Container(
        child: Row(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Notifiable:", style: TextStyle(fontSize: 16))),
        Padding(
            padding: EdgeInsets.zero,
            child: Checkbox(
                checkColor: Colors.white,
                value: param.isNotifiable,
                shape: CircleBorder(),
                onChanged: (bool? value) => {
                      setState(() => {param.isNotifiable = value!})
                    })),
        Padding(
            padding: EdgeInsets.only(left: 25, right: 5),
            child: Text("Categories: ", style: TextStyle(fontSize: 16))),
        Container(
            width: 120,
            padding: EdgeInsets.only(right: 15),
            child: DropdownButton(
              value: param.selectedCategory,
              underline: SizedBox(),
              iconSize: 35,
              onChanged: (String? newChoice) => {
                setState(() => {param.selectedCategory = newChoice!})
              },
              items: categories
                  .map((String category) => DropdownMenuItem<String>(
                      value: category,
                      child: Text(category, style: TextStyle(fontSize: 16))))
                  .toList(),
            )),
      ],
    ));
  }
}
