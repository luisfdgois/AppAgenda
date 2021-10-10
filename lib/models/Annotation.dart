import 'package:flutter/material.dart';

class Annotation {
  int? Id;
  final String Title;
  final String Description;
  final String Category;
  final DateTime Date;
  final bool Notifiable;

  Annotation(
      this.Id,
      this.Title,
      this.Description,
      this.Category,
      this.Date,
      this.Notifiable);
}