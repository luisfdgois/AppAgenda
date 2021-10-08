import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTable extends StatefulWidget {
  const CalendarTable({Key? key}) : super(key: key);

  @override
  _CalendarTableState createState() => _CalendarTableState();
}

class _CalendarTableState extends State<CalendarTable> {
  @override
  Widget build(BuildContext context) {
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
}
