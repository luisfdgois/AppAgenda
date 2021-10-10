import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/AnnotationRepository.dart';
import 'package:projeto_agenda/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (ctx) => AnnotationRepository())
    ], child: MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
  }
}
