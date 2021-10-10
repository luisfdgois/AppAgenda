import 'package:flutter/material.dart';
import 'package:projeto_agenda/views/annotations_forms/annotation_create.dart';

class AnnotationFloating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepOrangeAccent,
      foregroundColor: Colors.white,
      child: Icon(Icons.add),
      onPressed: () => {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AnnotationCreate()))
      },
    );
  }
}
