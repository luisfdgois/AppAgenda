import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:projeto_agenda/models/Annotation.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:projeto_agenda/views/annotations/list/annotation_details.dart';

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
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              context: context,
              builder: (context) => AnnotationDetails(annotation)),
        ));
  }

  Widget _title(Annotation annotation) {
    return Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Expanded(
                flex: 15,
                child: Text(
                  annotation.Title,
                  maxLines: 1,
                )),
            if (annotation.Notifiable)
              Expanded(
                  child: Icon(Icons.notifications_active_outlined, size: 18))
          ],
        ));
  }

  Widget _subtitle(Annotation annotation) {
    return Padding(
        padding: EdgeInsets.all(0),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Text(formatDate(
                    annotation.Date, ['mm', '/', 'dd', '/', 'yyyy']))),
            Expanded(flex: 5, child: Text(annotation.Category))
          ],
        ));
  }
}
