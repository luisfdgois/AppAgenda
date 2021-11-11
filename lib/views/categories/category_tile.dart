import 'package:flutter/material.dart';
import 'package:projeto_agenda/models/Category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton( icon: Icon(Icons.edit, color: Colors.deepOrangeAccent,), onPressed: () {}),
            IconButton( icon: Icon(Icons.delete, color: Colors.deepOrangeAccent,), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
