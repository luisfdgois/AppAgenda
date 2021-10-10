import 'package:flutter/cupertino.dart';
import 'package:projeto_agenda/data/DataBase.dart';

class CategoryRepository extends ChangeNotifier{

  final Map<String, String> _categories = {...dummy_categories};

  List<String> getAll(){
    return _categories.values.toList();
  }
}