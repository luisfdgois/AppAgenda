import 'package:date_format/date_format.dart';
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
  String? _chosenCategory;

  DateTime _selectedDate = DateTime.now();
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("New Annotation", textAlign: TextAlign.center),
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
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 15),
                            child:
                                Text("Title:", style: TextStyle(fontSize: 16)),
                          ),
                          Container(
                              width: 330,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                style: TextStyle(fontSize: 17),
                                decoration: _buildInputDecoration(),
                                onSaved: (value) => _mapForm["title"] = value!,
                              )),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(bottom: 10, left: 15),
                            child: Text("Description:",
                                style: TextStyle(fontSize: 16)),
                          ),
                          Container(
                              width: 330,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                  style: TextStyle(fontSize: 17),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 6,
                                  decoration: _buildInputDecoration(),
                                  onSaved: (value) =>
                                      _mapForm["description"] = value!))
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 15, bottom: 10),
                              child: Text("Select Category:",
                                  style: TextStyle(fontSize: 16))),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 20),
                              width: 330,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Color(0xffBCBCBC), width: 1)),
                              child: DropdownButton(
                                value: _chosenCategory,
                                isExpanded: true,
                                iconSize: 35,
                                onChanged: (String? newChoice) => {
                                  setState(() {
                                    _chosenCategory = newChoice!;
                                    _mapForm["title"] = _chosenCategory!;
                                  })
                                },
                                items: _categories
                                    .map((String category) =>
                                        DropdownMenuItem<String>(
                                            value: category,
                                            child: Text(category,
                                                style:
                                                    TextStyle(fontSize: 17))))
                                    .toList(),
                              )),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 20, right: 10),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 15, bottom: 10),
                              child: Text("Remember Me:",
                                  style: TextStyle(fontSize: 16))),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                      onPressed: () {
                                        _selectDate(context);
                                      },
                                      icon: Icon(Icons.calendar_today,
                                          color: Colors.orangeAccent,
                                          size: 32)),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                        width: 120,
                                        height: 40,
                                        margin: EdgeInsets.only(
                                            left: 5, right: 20),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color(0xffBCBCBC))),
                                        child: Text(
                                          formatDate(_selectedDate,
                                              ['mm', '/', 'dd', '/', 'yyyy']),
                                          style: TextStyle(fontSize: 17),
                                        ))),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                      onPressed: () {
                                        _selectTime(context);
                                      },
                                      icon: Icon(Icons.timer,
                                          color: Colors.orangeAccent,
                                          size: 35)),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        width: 80,
                                        height: 40,
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color(0xffBCBCBC))),
                                        child: Text(
                                          _selectedTime != null
                                              ? "${_selectedTime!.hour}:${_selectedTime!.minute}"
                                              : "00:00",
                                          style: TextStyle(fontSize: 17),
                                        )))
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
                                padding: EdgeInsets.only(top: 70),
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      _form.currentState?.save();
                                      Provider.of<AnnotationRepository>(context,
                                              listen: false)
                                          .add(
                                              _createAnnotationFromFormFields());
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(Icons.add, size: 20),
                                    label: Text("Confirm",
                                        style: TextStyle(fontSize: 19)),
                                    style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(Size(250, 45)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green))))),
                        Center(
                            child: Container(
                                padding: EdgeInsets.only(top: 35),
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
                                        fixedSize: MaterialStateProperty.all(Size(200, 45)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red)))))
                      ],
                    ),
                  )
                ]))));
  }

  Annotation _createAnnotationFromFormFields() {
    return Annotation(
        0,
        _mapForm["title"]!.toString(),
        _mapForm["description"]!.toString(),
        _chosenCategory!,
        _getDate(),
        _isNotifiable());
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
        alignLabelWithHint: true,
        focusedBorder: _buildFocusedBorder(),
        enabledBorder: _buildEnabledBorder());
  }

  OutlineInputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff9CE5FF)),
        borderRadius: BorderRadius.circular(12));
  }

  OutlineInputBorder _buildEnabledBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffBCBCBC)),
        borderRadius: BorderRadius.circular(12));
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
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
    if (_selectedTime != null)
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month,
          _selectedDate.day, _selectedDate.hour, _selectedDate.minute);

    return _selectedDate;
  }

  bool _isNotifiable() {
    return _selectedTime != null;
  }
}
