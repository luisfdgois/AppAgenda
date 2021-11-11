import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/query_filters/GetAnnotationsParam.dart';
import 'package:projeto_agenda/models/Annotation.dart';
import 'package:projeto_agenda/data/DataBase.dart';

class AnnotationRepository extends ChangeNotifier {
  final Map<String, Annotation> _annotations = {...dummy_annotations};

  List<Annotation> all(GetAnnotationsParam param) {
    var query = _annotations.values.where((annotation) =>
        (annotation.date.year == param.selectedDate.year) &&
        (annotation.date.month == param.selectedDate.month) &&
        (annotation.date.day == param.selectedDate.day));

    if (param.selectedCategory != null)
      query = query
          .where((annotation) => annotation.category == param.selectedCategory);

    if (param.isNotifiable != false)
      query = query.where((annotation) => annotation.notifiable == true);

    return query.toList();
  }

  Annotation getById(int id){
    return _annotations.values.firstWhere((element) => element.id == id);
  }

  void add(Annotation annotation) {
    final id = _annotations.values.last.id! + 1;
    annotation.id = id;

    _annotations.putIfAbsent(id.toString(), () => annotation);

    notifyListeners();
  }

  void update(int id, Annotation annotation) {
    _annotations.removeWhere((key, value) => value.id == id);

    annotation.id = id;

    _annotations.putIfAbsent(annotation.id.toString(), () => annotation);

    notifyListeners();
  }

  void remove(int id) {
    _annotations.removeWhere((key, value) => value.id == id);

    notifyListeners();
  }
}
