import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projeto_agenda/routes/app_routes.dart';

class AnnotationFloating extends StatelessWidget {
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
          onTap: () => {
            Navigator.of(context).pushNamed(AppRoutes.ANNOTATION_CREATE)
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.post_add),
          foregroundColor: Colors.white,
          backgroundColor: Color(0xff0884CA),
          label: "New Annotation",
          onTap: () => {
            Navigator.of(context).pushNamed(AppRoutes.ANNOTATION_CREATE)
          },
        )
      ],
    );
  }
}
