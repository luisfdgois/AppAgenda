import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/CategoryRepository.dart';
import 'package:projeto_agenda/data/query_filters/GetAnnotationsParam.dart';
import 'package:projeto_agenda/models/Category.dart';
import 'package:projeto_agenda/views/annotations/list/annotations_list.dart';
import 'package:projeto_agenda/views/home_floating_buttons.dart';
import 'package:projeto_agenda/views/calendar/calendar_components.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GetAnnotationsParam param = GetAnnotationsParam(DateTime.now(), null, false);

  @override
  Widget build(BuildContext context) {
    final CategoryRepository _categories = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Agenda"),
          backgroundColor: Color(0xff0884ca),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 100),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 75.0),
          child: Column(
            children: [
              _calendarTable(),
              _divider(),
              _filters(_categories),
              AnnotationList(param)
            ],
          ),
        ),
        floatingActionButton: HomeFloatingButtons());
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
      onPageChanged: (date) {
        setState(() {
          if (date.month == DateTime.now().month)
            param.selectedDate = DateTime.now();
          else
            param.selectedDate = date;
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

  Widget _filters(CategoryRepository repository) {
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
              items: repository.getAll()
                  .map((Category category) => DropdownMenuItem<String>(
                      value: category.name,
                      child:
                          Text(category.name, style: TextStyle(fontSize: 16))))
                  .toList(),
            )),
      ],
    ));
  }
}
