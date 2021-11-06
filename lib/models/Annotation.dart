
class Annotation {
  int? Id;
  String Title;
  String Description;
  String Category;
  DateTime Date;
  bool Notifiable;

  Annotation(
      this.Id,
      this.Title,
      this.Description,
      this.Category,
      this.Date,
      this.Notifiable);
}