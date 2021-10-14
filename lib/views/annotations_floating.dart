import 'package:flutter/material.dart';
import 'package:projeto_agenda/routes/app_routes.dart';

class AnnotationFloating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepOrangeAccent,
      foregroundColor: Colors.white,
      child: Icon(Icons.add),
      onPressed: () => {
        Navigator.of(context).pushNamed(AppRoutes.ANNOTATION_CREATE)
      },
    );
  }
}
