class Annotation {
  int? id;
  String title;
  String description;
  String category;
  DateTime date;
  bool notifiable;

  Annotation(this.id, this.title, this.description, this.category, this.date,
      this.notifiable);
}
