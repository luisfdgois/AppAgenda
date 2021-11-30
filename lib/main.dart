import 'package:flutter/material.dart';
import 'package:projeto_agenda/data/AnnotationRepository.dart';
import 'package:projeto_agenda/data/CategoryRepository.dart';
import 'package:projeto_agenda/home.dart';
import 'package:projeto_agenda/routes/app_routes.dart';
import 'package:projeto_agenda/views/annotations/forms/annotation_create.dart';
import 'package:projeto_agenda/views/annotations/forms/annotation_edit.dart';
import 'package:provider/provider.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => AnnotationRepository()),
          ChangeNotifierProvider(create: (ctx) => CategoryRepository())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Home(),
            routes: {
              AppRoutes.HOME: (_) => Home(),
              AppRoutes.ANNOTATION_CREATE: (_) => AnnotationCreate(),
              AppRoutes.ANNOTATION_EDIT: (_) => AnnotationEdit()
            }));
  }
}
