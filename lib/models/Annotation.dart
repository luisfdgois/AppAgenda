import 'package:flutter/material.dart';

class Annotation {
  final int Id;
  final String Title;
  final String Description;
  final String Category;
  final DateTime Date;
  final DateTime? DateRemind;

  const Annotation(
      this.Id,
      this.Title,
      this.Description,
      this.Category,
      this.Date,
      this.DateRemind);
}