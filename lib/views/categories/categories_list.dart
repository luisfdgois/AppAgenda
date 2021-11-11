import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/CategoryRepository.dart';
import 'package:projeto_agenda/views/categories/category_tile.dart';
import 'package:provider/provider.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryRepository _repository = Provider.of(context);
    final _categories = _repository.getAll();

    return Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          backgroundColor: Color(0xff0884ca),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 100),
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            itemCount: _categories.length,
            itemBuilder: (context, index) =>
                CategoryTile(_categories.elementAt(index))));
  }
}
