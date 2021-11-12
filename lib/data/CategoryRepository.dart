import 'package:flutter/cupertino.dart';
import 'package:projeto_agenda/data/DataBase.dart';
import 'package:projeto_agenda/models/Category.dart';

class CategoryRepository extends ChangeNotifier{

  final Map<String, Category> _categories = {...dummy_categories};

  List<Category> getAll(){
    return _categories.values.toList();
  }

  void add(Category category) {
    final id = _categories.values.last.id! + 1;
    category.id = id;

    _categories.putIfAbsent(id.toString(), () => category);

    notifyListeners();
  }

  void update(int id, Category category) {
    _categories.removeWhere((key, value) => value.id == id);

    category.id = id;

    _categories.putIfAbsent(category.id.toString(), () => category);

    notifyListeners();
  }

  void remove(int id) {
    _categories.removeWhere((key, value) => value.id == id);

    notifyListeners();
  }
}