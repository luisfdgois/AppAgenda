import 'package:flutter/cupertino.dart';
import 'package:projeto_agenda/data/DataBase.dart';
import 'package:projeto_agenda/models/Category.dart';

class CategoryRepository extends ChangeNotifier{

  final Map<String, Category> _categories = {...dummy_categories};

  List<Category> getAll(){
    return _categories.values.toList();
  }
}