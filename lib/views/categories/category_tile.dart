import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/CategoryRepository.dart';
import 'package:projeto_agenda/models/Category.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    final CategoryRepository _repository = Provider.of(context);

    return Card(
        child: ListTile(
      title: Text(category.name),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            _editButton(context, _repository),
            _deleteButton(context, _repository)
          ],
        ),
      ),
    ));
  }

  Widget _editButton(BuildContext context, CategoryRepository repository) {
    String? categoryName;

    return IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.deepOrangeAccent,
        ),
        onPressed: () {
          Alert(
              context: context,
              content: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: category.name,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: 'Category Name',
                    ),
                    onChanged: (value) => categoryName = value,
                  )
                ],
              ),
              buttons: [
                DialogButton(
                    child: Text("Confirm",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    onPressed: () {
                      repository.update(category.id!, Category(0, categoryName!));
                      Navigator.pop(context);
                    },
                    color: Color(0xff0884CA)),
                DialogButton(
                    child: Text("Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    color: Colors.deepOrangeAccent,
                    onPressed: () {
                      Navigator.pop(context);
                      categoryName = null;
                    })
              ]).show();
        });
  }

  Widget _deleteButton(BuildContext context, CategoryRepository repository) {
    return IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.deepOrangeAccent,
        ),
        onPressed: () {
          Alert(
              context: context,
              type: AlertType.warning,
              title: "Delete Category",
              desc:
                  "This action will also remove all annotations belonging to this Category.",
              buttons: [
                DialogButton(
                    child: Text("Confirm",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {
                      repository.remove(category.id!);
                      Navigator.pop(context);
                    },
                    color: Color(0xff0884CA)),
                DialogButton(
                    child: Text("Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    color: Colors.deepOrangeAccent,
                    onPressed: () => Navigator.pop(context))
              ]).show();
        });
  }
}
