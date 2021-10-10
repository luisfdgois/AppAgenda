import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/AnnotationRepository.dart';
import 'package:projeto_agenda/data/DataBase.dart';
import 'package:projeto_agenda/models/Annotation.dart';
import 'package:provider/provider.dart';

class AnnotationCreate extends StatefulWidget {
  const AnnotationCreate({Key? key}) : super(key: key);

  @override
  _AnnotationCreateState createState() => _AnnotationCreateState();
}

class _AnnotationCreateState extends State<AnnotationCreate> {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _mapForm = {};

  final _categories = {...dummy_categories}.values.toList();
  String _chosenCategory = "Any";

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Annotation", textAlign: TextAlign.center),
            backgroundColor: Color(0xff0884CA),
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 100)),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
                key: _form,
                child: ListView(children: [
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Container(
                          width: 330,
                          decoration: BoxDecoration(
                              color: Color(0xffE6F2F9),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Title',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff9CE5FF)),
                                    borderRadius: BorderRadius.circular(12)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff9CE5FF)),
                                    borderRadius: BorderRadius.circular(12))),
                            onSaved: (value) => _mapForm["title"] = value!,
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Container(
                          width: 330,
                          decoration: BoxDecoration(
                              color: Color(0xffE6F2F9),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 6,
                              decoration: InputDecoration(
                                  labelText: 'Description',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff9CE5FF)),
                                      borderRadius: BorderRadius.circular(12)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff9CE5FF)),
                                      borderRadius: BorderRadius.circular(12))),
                              onSaved: (value) =>
                                  _mapForm["description"] = value!))),
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  EdgeInsets.only(top: 5, left: 5, bottom: 10),
                              child: Text("Select Category:",
                                  style: TextStyle(fontSize: 17))),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 10),
                              width: 300,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: Color(0xffE6F2F9),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Color(0xff9CE5FF), width: 1)),
                              child: DropdownButton(
                                value: _chosenCategory,
                                isExpanded: true,
                                iconSize: 35,
                                onChanged: (String? newChoice) => {
                                  setState(() {
                                    _chosenCategory = newChoice!;
                                    _mapForm["title"] = _chosenCategory;
                                  })
                                },
                                items: _categories
                                    .map((String category) =>
                                        DropdownMenuItem<String>(
                                            value: category,
                                            child: Text(category,
                                                style:
                                                    TextStyle(fontSize: 16))))
                                    .toList(),
                              )),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  EdgeInsets.only(top: 10, left: 5, bottom: 5),
                              child: Text("Remember Me:",
                                  style: TextStyle(fontSize: 17))),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: IconButton(
                                      onPressed: () {
                                        _selectDate(context);
                                      },
                                      icon: Icon(Icons.calendar_today,
                                          color: Colors.orangeAccent,
                                          size: 35)),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: IconButton(
                                      onPressed: () {
                                        _selectTime(context);
                                      },
                                      icon: Icon(Icons.timer,
                                          color: Colors.orangeAccent,
                                          size: 35)),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                    child: Column(
                      children: [
                        Center(
                            child: Container(
                                padding: EdgeInsets.only(top: 20),
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      _form.currentState?.save();

                                      Provider.of<AnnotationRepository>(context,
                                              listen: false)
                                          .add(Annotation(
                                              0,
                                              _mapForm["title"]!.toString(),
                                              _mapForm["description"]!
                                                  .toString(),
                                              _chosenCategory,
                                              _getDate(),
                                              _isNotifiable()));
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(Icons.add, size: 20),
                                    label: Text("Confirm",
                                        style: TextStyle(fontSize: 19)),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green))))),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 10, top: 45, bottom: 10, right: 5),
                            child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.cancel_rounded,
                                  size: 20,
                                ),
                                label: Text("Cancel",
                                    style: TextStyle(fontSize: 19)),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red))))
                      ],
                    ),
                  )
                ]))));
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000, 1, 1),
        lastDate: DateTime(2030, 12, 31),
        initialDatePickerMode: DatePickerMode.day);

    if (picked != null)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context, initialTime: _selectedTime ?? TimeOfDay.now());

    if (picked != null)
      setState(() {
        _selectedTime = picked;
      });
  }

  DateTime _getDate() {
    if (_selectedDate == null) return DateTime.now();

    if (_selectedTime != null)
      _selectedDate = DateTime(_selectedDate!.year, _selectedDate!.month,
          _selectedDate!.day, _selectedDate!.hour, _selectedDate!.minute);

    return _selectedDate!;
  }

  bool _isNotifiable() {
    return _selectedTime != null;
  }
}
