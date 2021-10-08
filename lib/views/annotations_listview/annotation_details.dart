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
        buildPropertyAndValue("Title:", annotation.Title, 70),
        buildPropertyAndValue("Description:", annotation.Description, 10),
        buildPropertyAndValue("Category:", annotation.Category, 10),
        buildPropertyAndValue("Creation Date:",
            formatDate(annotation.Date, ['mm', '/', 'dd', '/', 'yyyy']), 10),
        if(annotation.DateRemind != null)
          buildPropertyAndValue("Notify At:",
              formatDate(annotation.DateRemind!, ['mm', '/', 'dd', '/', 'yyyy', ' at ', 'HH', ':', 'nn', am]), 10)
      ],
    );
  }

  Widget buildPropertyAndValue(String propertyName, String value,
      double marginTop) {
    return Column(
        children: [
          Container(
            color: Color(0xff7FBCDE),
            width: double.infinity,
            margin: EdgeInsets.only(top: marginTop, bottom: 5),
            padding: EdgeInsets.only(left: 15, top: 8),
            height: 35,
            child: Text(propertyName, style: TextStyle(fontSize: 16)),
          ),
          Container(
              padding: EdgeInsets.only(left: 15, top: 8),
              child: Text(value, style: TextStyle(fontSize: 15))
          )
        ]
    );
  }
}
