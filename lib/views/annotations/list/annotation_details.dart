import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/AnnotationRepository.dart';
import 'package:projeto_agenda/models/Annotation.dart';
import 'package:date_format/date_format.dart';
import 'package:projeto_agenda/routes/app_routes.dart';
import 'package:provider/provider.dart';

class AnnotationDetails extends StatelessWidget {
  final Annotation annotation;

  const AnnotationDetails(this.annotation);

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        _buildPropertyAndValue("Title:", annotation.Title, 70),
        _buildPropertyAndValue("Description:", annotation.Description, 10),
        _buildPropertyAndValue("Category:", annotation.Category, 10),
        if (annotation.Notifiable)
          _notifiable(annotation.Date, 10)
        else
          _buildPropertyAndValue("Date:",
              formatDate(annotation.Date, ['mm', '/', 'dd', '/', 'yyyy']), 10),
        Row(
          children: [
            _editButton(context, annotation),
            _deleteButton(context)
          ],
        )
      ],
    );
  }

  Widget _buildPropertyAndValue(String propertyName, String value,
      double marginTop) {
    return Column(children: [
      Container(
        color: Color(0xff7FBCDE),
        width: 370,
        margin: EdgeInsets.only(top: marginTop, bottom: 5),
        padding: EdgeInsets.only(left: 15, top: 8),
        height: 35,
        child: Text(propertyName, style: TextStyle(fontSize: 17)),
      ),
      Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 15, top: 8, right: 15),
          child: Text(value, style: TextStyle(fontSize: 16)))
    ]);
  }

  Widget _notifiable(DateTime date, double marginTop) {
    return Column(
      children: [
        Container(
            color: Color(0xff7FBCDE),
            width: 370,
            margin: EdgeInsets.only(top: marginTop, bottom: 5),
            padding: EdgeInsets.only(left: 15, top: 8),
            height: 35,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text("Date:", style: TextStyle(fontSize: 17)),
                ),
                Expanded(
                  flex: 5,
                  child: Text("Notify At:", style: TextStyle(fontSize: 16)),
                )
              ],
            )),
        Container(
            padding: EdgeInsets.only(left: 15, top: 8, right: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(formatDate(date, ['mm', '/', 'dd', '/', 'yyyy']),
                      style: TextStyle(fontSize: 16)),
                ),
                Expanded(
                  flex: 5,
                  child: Text(formatDate(date, ['HH', '\\h', 'nn']),
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ))
      ],
    );
  }

  Widget _deleteButton(BuildContext context) {
    final AnnotationRepository _repository = Provider.of(context);

    return Padding(
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5),
        child: ElevatedButton.icon(
            onPressed: () {
              _repository.remove(annotation.Id!);
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.delete_forever,
              size: 20,
            ),
            label: Text("Delete", style: TextStyle(fontSize: 18)),
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Colors.deepOrangeAccent)))
    );
  }

  Widget _editButton(BuildContext context, Annotation annotation) {
    return Padding(
        padding: EdgeInsets.only(left: 100, top: 10, bottom: 10, right: 5),
        child: ElevatedButton.icon(
            onPressed: () =>
            {
              Navigator.of(context).pushNamed(
                  AppRoutes.ANNOTATION_EDIT, arguments: annotation)
            },
            icon: Icon(Icons.edit, size: 20),
            label: Text("Edit", style: TextStyle(fontSize: 18)),
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Colors.blueAccent))));
  }
}
