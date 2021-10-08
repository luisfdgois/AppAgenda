import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/AnnotationRepository.dart';
import 'package:projeto_agenda/views/annotations_listview/annotation_tile.dart';

class AnnotationList extends StatelessWidget {

  final annotations = {...dummy_anotations}.values.toList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: dummy_anotations.length,
            itemBuilder: (context, index) =>
                AnnotationTile(annotations.elementAt(index)))
    );;
  }
}
