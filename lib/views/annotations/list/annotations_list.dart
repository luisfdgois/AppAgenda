import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/AnnotationRepository.dart';
import 'package:projeto_agenda/data/query_filters/GetAnnotationsParam.dart';
import 'package:projeto_agenda/views/annotations/list/annotation_tile.dart';
import 'package:provider/provider.dart';

class AnnotationList extends StatelessWidget {
  final GetAnnotationsParam param;

  const AnnotationList(this.param);

  @override
  Widget build(BuildContext context) {
    final AnnotationRepository _repository = Provider.of(context);
    final _annotations = _repository.all(param);

    return Expanded(
        child: ListView.builder(
            itemCount: _annotations.length,
            itemBuilder: (context, index) =>
                AnnotationTile(_annotations.elementAt(index))));
  }
}
