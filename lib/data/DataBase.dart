
import 'package:projeto_agenda/models/Annotation.dart';
import 'package:projeto_agenda/models/Category.dart';

final dummy_annotations = {
  '1': Annotation(1, "Reunião de alinhamento sprint 1",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime.now(), false),
  '2': Annotation(2, "Reunião de alinhamento sprint 2",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime.now(), true),
  '3': Annotation(3, "Reunião de alinhamento sprint 3",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime.now(), true),
  '4': Annotation(4, "Reunião de alinhamento sprint 4",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime.now(), false),
  '5': Annotation(5, "Reunião de alinhamento sprint 5",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime.now(), false),
  '6': Annotation(6, "Reunião de alinhamento sprint 6",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime.now(), true),
  '7': Annotation(7, "Reunião de alinhamento sprint 7",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime.now(), false),
  '8': Annotation(8, "Reunião de alinhamento sprint 8 Reunião de alinhamento sprint 1",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime(2021, 10, 1), false),
  '9': Annotation(9, "Reunião de alinhamento sprint 9",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime(2021, 10, 1), false),
  '10': Annotation(10, "Reunião de alinhamento sprint 10",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime(2021, 10, 4), true),
  '11': Annotation(11, "Reunião de alinhamento sprint 11",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime(2021, 10, 4), false),
  '12': Annotation(12, "Reunião de alinhamento sprint 12",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime(2021, 10, 5), false),
  '13': Annotation(13, "Reunião de alinhamento sprint 13",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime(2021, 10, 6), false),
  '14': Annotation(14, "Reunião de alinhamento sprint 14",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Meetings", DateTime(2021, 10, 6), false),
};

final dummy_categories = {
  '1': Category(1, "Any"),
  '2': Category(2, "Meetings"),
  '3': Category(3, "Gym"),
  '4': Category(4, "Work"),
  '5': Category(5, "College")
};