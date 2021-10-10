import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/CategoryRepository.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {

  final CategoryRepository _repository = CategoryRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Menu"),
          backgroundColor: Color(0xff0884CA),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 100)),
    );
  }
}
