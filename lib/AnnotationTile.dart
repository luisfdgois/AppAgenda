import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:projeto_agenda/models/Annotation.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class AnnotationTile extends StatelessWidget {

  final Annotation annotation;

  const AnnotationTile(this.annotation);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff7FBCDE),
      child: ListTile(
        title: _title(annotation),
        subtitle: _subtitle(annotation),
        onTap: () => showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)
              )
            ),
            context: context,
            builder: (context) => _buildSheet(annotation)),
      )
    );
  }
}

Widget _title(Annotation annotation){
  return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
              flex: 9,
              child: Text(annotation.Title, maxLines: 1,)),
          if(annotation.DateRemind != null)
            Expanded(
                child: Icon(Icons.notifications_active_outlined, size: 18)
            )
        ],
      )
  );
}

Widget _subtitle(Annotation annotation){
  return Padding(
      padding: EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: Text(formatDate(annotation.Date, ['dd','/', 'mm', '/', 'yyyy']))),
          Expanded(
              flex: 5,
              child: Text(annotation.Category)
          )
        ],
      )
  );
}

Widget _buildButton(
    { required String text,required VoidCallback onClicked}) =>
    ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder()
        ),
        child: Text(""),
        onPressed: onClicked
    );

Widget _buildSheet(Annotation annotation){
  return ListView(
    children: [
      buildPropertyAndValue("Title:", annotation.Title, 70),
      buildPropertyAndValue("Description:", annotation.Description, 10),
      buildPropertyAndValue("Category:", annotation.Category, 10),
      buildPropertyAndValue("Creation Date:", formatDate(annotation.Date, ['mm','/', 'dd', '/', 'yyyy']), 10),
      if(annotation.DateRemind != null)
        buildPropertyAndValue("Notify At:",
            formatDate(annotation.DateRemind!, ['mm','/', 'dd', '/', 'yyyy', ' at ', 'HH', ':', 'nn', am]), 10)
    ],
  );
}

Widget buildPropertyAndValue(String propertyName, String value, double marginTop){
  return Column(
      children: [
        Container(
          color: Color(0xff7FBCDE),
          width: double.infinity,
          margin: EdgeInsets.only(top:marginTop, bottom: 5),
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