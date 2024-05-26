import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class TimeOfDayConverter extends TypeConverter<TimeOfDay, String> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromSql(String fromDb) {
    final parts = fromDb.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));

  }

  @override
  String toSql(TimeOfDay value) {
    // TODO: implement toSql
    return '${value.hour}:${value.minute}';
  }
}