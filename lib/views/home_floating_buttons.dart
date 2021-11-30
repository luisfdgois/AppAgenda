import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projeto_agenda/routes/app_routes.dart';
import 'package:projeto_agenda/views/categories/categories_list.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeFloatingButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Colors.deepOrangeAccent,
      foregroundColor: Colors.white,
      animatedIcon: AnimatedIcons.menu_close,
      overlayOpacity: 0.4,
      children: [
        SpeedDialChild(
          child: Icon(Icons.category),
          foregroundColor: Colors.white,
          backgroundColor: Color(0xff0884CA),
          label: "Categories",
          onTap: () =>
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategoriesList()))
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.post_add),
          foregroundColor: Colors.white,
          backgroundColor: Color(0xff0884CA),
          label: "New Annotation",
          onTap: () =>
          {
            Navigator.of(context).pushNamed(AppRoutes.ANNOTATION_CREATE)
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.alarm),
          foregroundColor: Colors.white,
          backgroundColor: Color(0xff0884CA),
          label: "Test Alarm",
          onTap: ()
          {
            Test(context);
            AndroidAlarmManager.periodic(Duration(seconds: 5), 0, () {
              Test(context);
            });
          },
        )
      ],
    );
  }
}

void Test(BuildContext context) {
  Alert(
    context: context,
    title: "Delete Category",
    desc:
    "This action will also remove all annotations belonging to this Category.",
  ).show();
}
