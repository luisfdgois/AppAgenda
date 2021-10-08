import 'package:flutter/material.dart';
import 'package:projeto_agenda/models/Annotation.dart';
import 'package:date_format/date_format.dart';

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
        _buildPropertyAndValue("Creation Date:",
            formatDate(annotation.Date, ['mm', '/', 'dd', '/', 'yyyy']), 10),
        if(annotation.DateRemind != null)
          _buildPropertyAndValue("Notify At:",
              formatDate(annotation.DateRemind!, ['mm', '/', 'dd', '/', 'yyyy', ' at ', 'HH', '\\h', 'nn']), 10),
        _actionbuttons()
      ],
    );
  }

  Widget _buildPropertyAndValue(String propertyName, String value,
      double marginTop) {
    return Column(
        children: [
          Container(
            color: Color(0xff7FBCDE),
            width: double.infinity,
            margin: EdgeInsets.only(top: marginTop, bottom: 5),
            padding: EdgeInsets.only(left: 15, top: 8),
            height: 35,
            child: Text(propertyName, style: TextStyle(fontSize: 17)),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15, top: 8, right: 15),
              child: Text(value, style: TextStyle(fontSize: 16))
          )
        ]
    );
  }

  Widget _actionbuttons(){
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 100, top: 10, bottom: 10, right: 5),
            child: ElevatedButton.icon(
                onPressed: () => {},
                icon: Icon(Icons.edit, size: 20),
                label: Text("Edit", style: TextStyle(fontSize: 18)),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent)))),
        Padding(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5),
            child: ElevatedButton.icon(
                onPressed: () => {},
                icon: Icon(Icons.delete_forever, size: 20,),
                label: Text("Delete", style: TextStyle(fontSize: 18)),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red))))
      ],
    );
  }
}
