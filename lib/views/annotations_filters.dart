import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_agenda/data/AnnotationRepository.dart';

class AnnotationFilters extends StatefulWidget {
  const AnnotationFilters({Key? key}) : super(key: key);

  @override
  _AnnotationFiltersState createState() => _AnnotationFiltersState();
}

class _AnnotationFiltersState extends State<AnnotationFilters> {

  bool isChecked = false;

  final categories = {...dummy_categories}.values.toList();
  String chosenCategory = "Any";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Row(
          children: [
            Expanded(
              flex: 4, child: Text("Filters:", style: TextStyle(fontSize: 15))),
            Expanded(
              flex: 1,
              child: Checkbox(checkColor: Colors.white, value: isChecked, shape: CircleBorder(),
                onChanged: (bool? value) => {
                setState(() => { isChecked = value!})}
              )),
            Expanded(
              flex: 3, child: Text("Notifiable", style: TextStyle(fontSize: 15))),
            Container(
                child: DropdownButton(
                  value: chosenCategory,
                  underline: SizedBox(),
                  iconSize: 35,
                  onChanged: (String? newChoice) => {setState(() => {chosenCategory = newChoice!})},
                  items: categories.map((String category) =>
                      DropdownMenuItem<String>(value: category, child: Text(category, style: TextStyle(fontSize: 16)))
                  ).toList(),
                )
            )
          ],
        )
    );
  }
}
