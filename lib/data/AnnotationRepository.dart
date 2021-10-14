import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/query_filters/GetAnnotationsParam.dart';
import 'package:projeto_agenda/models/Annotation.dart';
import 'package:projeto_agenda/data/DataBase.dart';

class AnnotationRepository extends ChangeNotifier {
  final Map<String, Annotation> _annotations = {...dummy_annotations};

  List<Annotation> all(GetAnnotationsParam param) {
    var query = _annotations.values.where((annotation) =>
        (annotation.Date.year == param.selectedDate.year) &&
        (annotation.Date.month == param.selectedDate.month) &&
        (annotation.Date.day == param.selectedDate.day));

    if (param.selectedCategory != null)
      query = query
          .where((annotation) => annotation.Category == param.selectedCategory);

    if (param.isNotifiable != false)
      query = query.where((annotation) => annotation.Notifiable == true);

    return query.toList();
  }

  Annotation getById(int id){
    return _annotations.values.firstWhere((element) => element.Id == id);
  }

  void add(Annotation annotation) {
    final id = _annotations.values.last.Id! + 1;
    annotation.Id = id;

    _annotations.putIfAbsent(id.toString(), () => annotation);

    notifyListeners();
  }

  void update(int id, Annotation annotation) {
    _annotations.removeWhere((key, value) => value.Id == id);

    annotation.Id = id;

    _annotations.putIfAbsent(annotation.Id.toString(), () => annotation);

    notifyListeners();
  }

  void remove(int id) {
    _annotations.removeWhere((key, value) => value.Id == id);

    notifyListeners();
  }
}
