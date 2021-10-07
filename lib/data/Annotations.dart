import 'dart:ffi';

import 'package:projeto_agenda/models/Annotation.dart';

final dummy_anotations = {
  '1': Annotation(1, "Reunião de alinhamento sprint 1 Reunião de alinhamento sprint 1",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Reuniões", DateTime.now(), null),
  '2': Annotation(2, "Reunião de alinhamento sprint 2",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Reuniões", DateTime.now(), DateTime.now()),
  '3': Annotation(3, "Reunião de alinhamento sprint 3",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Reuniões", DateTime.now(), DateTime.now()),
  '4': Annotation(4, "Reunião de alinhamento sprint 4",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Reuniões", DateTime.now(), null),
  '5': Annotation(5, "Reunião de alinhamento sprint 5",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Reuniões", DateTime.now(), null),
  '6': Annotation(6, "Reunião de alinhamento sprint 6",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Reuniões", DateTime.now(), DateTime.now()),
  '7': Annotation(7, "Reunião de alinhamento sprint 7",
      "Reunião utilizada para debater mudanças solicitadas pelo cliente na regra de negócio.", "Reuniões", DateTime.now(), null),
};