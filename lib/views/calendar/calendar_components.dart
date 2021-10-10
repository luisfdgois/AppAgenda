import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarComponents {
  var headerStyle = HeaderStyle(
    titleCentered: true,
    formatButtonVisible: false,
    titleTextStyle: TextStyle(fontSize: 17, locale: Locale('pt', 'BR')),
  );

  var calendarStyle = CalendarStyle(
    canMarkersOverflow: true,
    todayDecoration:
        BoxDecoration(color: Color(0xff7FBCDE), shape: BoxShape.circle),
    selectedDecoration:
      BoxDecoration(color: Color(0xffFF855F), shape: BoxShape.circle),
    selectedTextStyle: TextStyle(color: Colors.white),

  );
}
