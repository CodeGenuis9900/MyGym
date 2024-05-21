// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WorkoutTable extends Workout with TableInfo<$WorkoutTable, WorkoutData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $WorkoutTable createAlias(String alias) {
    return $WorkoutTable(attachedDatabase, alias);
  }
}

class WorkoutData extends DataClass implements Insertable<WorkoutData> {
  final int id;
  final String name;
  const WorkoutData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  WorkoutCompanion toCompanion(bool nullToAbsent) {
    return WorkoutCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory WorkoutData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  WorkoutData copyWith({int? id, String? name}) => WorkoutData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('WorkoutData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutData && other.id == this.id && other.name == this.name);
}

class WorkoutCompanion extends UpdateCompanion<WorkoutData> {
  final Value<int> id;
  final Value<String> name;
  const WorkoutCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  WorkoutCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<WorkoutData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  WorkoutCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return WorkoutCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SessionTable extends Session with TableInfo<$SessionTable, SessionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<int> workoutId = GeneratedColumn<int>(
      'workout_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES workout (id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, workoutId, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session';
  @override
  VerificationContext validateIntegrity(Insertable<SessionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}workout_id']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $SessionTable createAlias(String alias) {
    return $SessionTable(attachedDatabase, alias);
  }
}

class SessionData extends DataClass implements Insertable<SessionData> {
  final int id;
  final int? workoutId;
  final DateTime date;
  const SessionData({required this.id, this.workoutId, required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || workoutId != null) {
      map['workout_id'] = Variable<int>(workoutId);
    }
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  SessionCompanion toCompanion(bool nullToAbsent) {
    return SessionCompanion(
      id: Value(id),
      workoutId: workoutId == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutId),
      date: Value(date),
    );
  }

  factory SessionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionData(
      id: serializer.fromJson<int>(json['id']),
      workoutId: serializer.fromJson<int?>(json['workoutId']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workoutId': serializer.toJson<int?>(workoutId),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  SessionData copyWith(
          {int? id,
          Value<int?> workoutId = const Value.absent(),
          DateTime? date}) =>
      SessionData(
        id: id ?? this.id,
        workoutId: workoutId.present ? workoutId.value : this.workoutId,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('SessionData(')
          ..write('id: $id, ')
          ..write('workoutId: $workoutId, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, workoutId, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionData &&
          other.id == this.id &&
          other.workoutId == this.workoutId &&
          other.date == this.date);
}

class SessionCompanion extends UpdateCompanion<SessionData> {
  final Value<int> id;
  final Value<int?> workoutId;
  final Value<DateTime> date;
  const SessionCompanion({
    this.id = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.date = const Value.absent(),
  });
  SessionCompanion.insert({
    this.id = const Value.absent(),
    this.workoutId = const Value.absent(),
    required DateTime date,
  }) : date = Value(date);
  static Insertable<SessionData> custom({
    Expression<int>? id,
    Expression<int>? workoutId,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutId != null) 'workout_id': workoutId,
      if (date != null) 'date': date,
    });
  }

  SessionCompanion copyWith(
      {Value<int>? id, Value<int?>? workoutId, Value<DateTime>? date}) {
    return SessionCompanion(
      id: id ?? this.id,
      workoutId: workoutId ?? this.workoutId,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<int>(workoutId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionCompanion(')
          ..write('id: $id, ')
          ..write('workoutId: $workoutId, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $MuscleTable extends Muscle with TableInfo<$MuscleTable, MuscleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MuscleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 7),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'muscle';
  @override
  VerificationContext validateIntegrity(Insertable<MuscleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MuscleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MuscleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
    );
  }

  @override
  $MuscleTable createAlias(String alias) {
    return $MuscleTable(attachedDatabase, alias);
  }
}

class MuscleData extends DataClass implements Insertable<MuscleData> {
  final int id;
  final String name;
  final String color;
  const MuscleData({required this.id, required this.name, required this.color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    return map;
  }

  MuscleCompanion toCompanion(bool nullToAbsent) {
    return MuscleCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
    );
  }

  factory MuscleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MuscleData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
    };
  }

  MuscleData copyWith({int? id, String? name, String? color}) => MuscleData(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('MuscleData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MuscleData &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color);
}

class MuscleCompanion extends UpdateCompanion<MuscleData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> color;
  const MuscleCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
  });
  MuscleCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String color,
  })  : name = Value(name),
        color = Value(color);
  static Insertable<MuscleData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
    });
  }

  MuscleCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? color}) {
    return MuscleCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MuscleCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $ExerciseTable extends Exercise
    with TableInfo<$ExerciseTable, ExerciseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $ExerciseTable createAlias(String alias) {
    return $ExerciseTable(attachedDatabase, alias);
  }
}

class ExerciseData extends DataClass implements Insertable<ExerciseData> {
  final int id;
  final String name;
  const ExerciseData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ExerciseCompanion toCompanion(bool nullToAbsent) {
    return ExerciseCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory ExerciseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  ExerciseData copyWith({int? id, String? name}) => ExerciseData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseData && other.id == this.id && other.name == this.name);
}

class ExerciseCompanion extends UpdateCompanion<ExerciseData> {
  final Value<int> id;
  final Value<String> name;
  const ExerciseCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ExerciseCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<ExerciseData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ExerciseCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return ExerciseCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $WorkoutExerciseTable extends WorkoutExercise
    with TableInfo<$WorkoutExerciseTable, WorkoutExerciseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutExerciseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<int> workoutId = GeneratedColumn<int>(
      'workout_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES workout (id)'));
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercise (id)'));
  @override
  List<GeneratedColumn> get $columns => [workoutId, exerciseId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_exercise';
  @override
  VerificationContext validateIntegrity(
      Insertable<WorkoutExerciseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  WorkoutExerciseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutExerciseData(
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}workout_id']),
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_id']),
    );
  }

  @override
  $WorkoutExerciseTable createAlias(String alias) {
    return $WorkoutExerciseTable(attachedDatabase, alias);
  }
}

class WorkoutExerciseData extends DataClass
    implements Insertable<WorkoutExerciseData> {
  final int? workoutId;
  final int? exerciseId;
  const WorkoutExerciseData({this.workoutId, this.exerciseId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || workoutId != null) {
      map['workout_id'] = Variable<int>(workoutId);
    }
    if (!nullToAbsent || exerciseId != null) {
      map['exercise_id'] = Variable<int>(exerciseId);
    }
    return map;
  }

  WorkoutExerciseCompanion toCompanion(bool nullToAbsent) {
    return WorkoutExerciseCompanion(
      workoutId: workoutId == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutId),
      exerciseId: exerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseId),
    );
  }

  factory WorkoutExerciseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutExerciseData(
      workoutId: serializer.fromJson<int?>(json['workoutId']),
      exerciseId: serializer.fromJson<int?>(json['exerciseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workoutId': serializer.toJson<int?>(workoutId),
      'exerciseId': serializer.toJson<int?>(exerciseId),
    };
  }

  WorkoutExerciseData copyWith(
          {Value<int?> workoutId = const Value.absent(),
          Value<int?> exerciseId = const Value.absent()}) =>
      WorkoutExerciseData(
        workoutId: workoutId.present ? workoutId.value : this.workoutId,
        exerciseId: exerciseId.present ? exerciseId.value : this.exerciseId,
      );
  @override
  String toString() {
    return (StringBuffer('WorkoutExerciseData(')
          ..write('workoutId: $workoutId, ')
          ..write('exerciseId: $exerciseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workoutId, exerciseId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutExerciseData &&
          other.workoutId == this.workoutId &&
          other.exerciseId == this.exerciseId);
}

class WorkoutExerciseCompanion extends UpdateCompanion<WorkoutExerciseData> {
  final Value<int?> workoutId;
  final Value<int?> exerciseId;
  final Value<int> rowid;
  const WorkoutExerciseCompanion({
    this.workoutId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutExerciseCompanion.insert({
    this.workoutId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<WorkoutExerciseData> custom({
    Expression<int>? workoutId,
    Expression<int>? exerciseId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (workoutId != null) 'workout_id': workoutId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutExerciseCompanion copyWith(
      {Value<int?>? workoutId, Value<int?>? exerciseId, Value<int>? rowid}) {
    return WorkoutExerciseCompanion(
      workoutId: workoutId ?? this.workoutId,
      exerciseId: exerciseId ?? this.exerciseId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workoutId.present) {
      map['workout_id'] = Variable<int>(workoutId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutExerciseCompanion(')
          ..write('workoutId: $workoutId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionMuscleTable extends SessionMuscle
    with TableInfo<$SessionMuscleTable, SessionMuscleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionMuscleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES session (id)'));
  static const VerificationMeta _muscleIdMeta =
      const VerificationMeta('muscleId');
  @override
  late final GeneratedColumn<int> muscleId = GeneratedColumn<int>(
      'muscle_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES muscle (id)'));
  @override
  List<GeneratedColumn> get $columns => [sessionId, muscleId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_muscle';
  @override
  VerificationContext validateIntegrity(Insertable<SessionMuscleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    }
    if (data.containsKey('muscle_id')) {
      context.handle(_muscleIdMeta,
          muscleId.isAcceptableOrUnknown(data['muscle_id']!, _muscleIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SessionMuscleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionMuscleData(
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id']),
      muscleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}muscle_id']),
    );
  }

  @override
  $SessionMuscleTable createAlias(String alias) {
    return $SessionMuscleTable(attachedDatabase, alias);
  }
}

class SessionMuscleData extends DataClass
    implements Insertable<SessionMuscleData> {
  final int? sessionId;
  final int? muscleId;
  const SessionMuscleData({this.sessionId, this.muscleId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<int>(sessionId);
    }
    if (!nullToAbsent || muscleId != null) {
      map['muscle_id'] = Variable<int>(muscleId);
    }
    return map;
  }

  SessionMuscleCompanion toCompanion(bool nullToAbsent) {
    return SessionMuscleCompanion(
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      muscleId: muscleId == null && nullToAbsent
          ? const Value.absent()
          : Value(muscleId),
    );
  }

  factory SessionMuscleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionMuscleData(
      sessionId: serializer.fromJson<int?>(json['sessionId']),
      muscleId: serializer.fromJson<int?>(json['muscleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sessionId': serializer.toJson<int?>(sessionId),
      'muscleId': serializer.toJson<int?>(muscleId),
    };
  }

  SessionMuscleData copyWith(
          {Value<int?> sessionId = const Value.absent(),
          Value<int?> muscleId = const Value.absent()}) =>
      SessionMuscleData(
        sessionId: sessionId.present ? sessionId.value : this.sessionId,
        muscleId: muscleId.present ? muscleId.value : this.muscleId,
      );
  @override
  String toString() {
    return (StringBuffer('SessionMuscleData(')
          ..write('sessionId: $sessionId, ')
          ..write('muscleId: $muscleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(sessionId, muscleId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionMuscleData &&
          other.sessionId == this.sessionId &&
          other.muscleId == this.muscleId);
}

class SessionMuscleCompanion extends UpdateCompanion<SessionMuscleData> {
  final Value<int?> sessionId;
  final Value<int?> muscleId;
  final Value<int> rowid;
  const SessionMuscleCompanion({
    this.sessionId = const Value.absent(),
    this.muscleId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionMuscleCompanion.insert({
    this.sessionId = const Value.absent(),
    this.muscleId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<SessionMuscleData> custom({
    Expression<int>? sessionId,
    Expression<int>? muscleId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sessionId != null) 'session_id': sessionId,
      if (muscleId != null) 'muscle_id': muscleId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionMuscleCompanion copyWith(
      {Value<int?>? sessionId, Value<int?>? muscleId, Value<int>? rowid}) {
    return SessionMuscleCompanion(
      sessionId: sessionId ?? this.sessionId,
      muscleId: muscleId ?? this.muscleId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (muscleId.present) {
      map['muscle_id'] = Variable<int>(muscleId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionMuscleCompanion(')
          ..write('sessionId: $sessionId, ')
          ..write('muscleId: $muscleId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $WorkoutTable workout = $WorkoutTable(this);
  late final $SessionTable session = $SessionTable(this);
  late final $MuscleTable muscle = $MuscleTable(this);
  late final $ExerciseTable exercise = $ExerciseTable(this);
  late final $WorkoutExerciseTable workoutExercise =
      $WorkoutExerciseTable(this);
  late final $SessionMuscleTable sessionMuscle = $SessionMuscleTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [workout, session, muscle, exercise, workoutExercise, sessionMuscle];
}

typedef $$WorkoutTableInsertCompanionBuilder = WorkoutCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$WorkoutTableUpdateCompanionBuilder = WorkoutCompanion Function({
  Value<int> id,
  Value<String> name,
});

class $$WorkoutTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutTable,
    WorkoutData,
    $$WorkoutTableFilterComposer,
    $$WorkoutTableOrderingComposer,
    $$WorkoutTableProcessedTableManager,
    $$WorkoutTableInsertCompanionBuilder,
    $$WorkoutTableUpdateCompanionBuilder> {
  $$WorkoutTableTableManager(_$AppDatabase db, $WorkoutTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WorkoutTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WorkoutTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$WorkoutTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              WorkoutCompanion(
            id: id,
            name: name,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              WorkoutCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$WorkoutTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $WorkoutTable,
    WorkoutData,
    $$WorkoutTableFilterComposer,
    $$WorkoutTableOrderingComposer,
    $$WorkoutTableProcessedTableManager,
    $$WorkoutTableInsertCompanionBuilder,
    $$WorkoutTableUpdateCompanionBuilder> {
  $$WorkoutTableProcessedTableManager(super.$state);
}

class $$WorkoutTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WorkoutTable> {
  $$WorkoutTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter sessionRefs(
      ComposableFilter Function($$SessionTableFilterComposer f) f) {
    final $$SessionTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.session,
        getReferencedColumn: (t) => t.workoutId,
        builder: (joinBuilder, parentComposers) => $$SessionTableFilterComposer(
            ComposerState(
                $state.db, $state.db.session, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter workoutExerciseRefs(
      ComposableFilter Function($$WorkoutExerciseTableFilterComposer f) f) {
    final $$WorkoutExerciseTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.workoutExercise,
            getReferencedColumn: (t) => t.workoutId,
            builder: (joinBuilder, parentComposers) =>
                $$WorkoutExerciseTableFilterComposer(ComposerState($state.db,
                    $state.db.workoutExercise, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$WorkoutTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WorkoutTable> {
  $$WorkoutTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SessionTableInsertCompanionBuilder = SessionCompanion Function({
  Value<int> id,
  Value<int?> workoutId,
  required DateTime date,
});
typedef $$SessionTableUpdateCompanionBuilder = SessionCompanion Function({
  Value<int> id,
  Value<int?> workoutId,
  Value<DateTime> date,
});

class $$SessionTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SessionTable,
    SessionData,
    $$SessionTableFilterComposer,
    $$SessionTableOrderingComposer,
    $$SessionTableProcessedTableManager,
    $$SessionTableInsertCompanionBuilder,
    $$SessionTableUpdateCompanionBuilder> {
  $$SessionTableTableManager(_$AppDatabase db, $SessionTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SessionTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SessionTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$SessionTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int?> workoutId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              SessionCompanion(
            id: id,
            workoutId: workoutId,
            date: date,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int?> workoutId = const Value.absent(),
            required DateTime date,
          }) =>
              SessionCompanion.insert(
            id: id,
            workoutId: workoutId,
            date: date,
          ),
        ));
}

class $$SessionTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $SessionTable,
    SessionData,
    $$SessionTableFilterComposer,
    $$SessionTableOrderingComposer,
    $$SessionTableProcessedTableManager,
    $$SessionTableInsertCompanionBuilder,
    $$SessionTableUpdateCompanionBuilder> {
  $$SessionTableProcessedTableManager(super.$state);
}

class $$SessionTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SessionTable> {
  $$SessionTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$WorkoutTableFilterComposer get workoutId {
    final $$WorkoutTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $state.db.workout,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WorkoutTableFilterComposer(
            ComposerState(
                $state.db, $state.db.workout, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter sessionMuscleRefs(
      ComposableFilter Function($$SessionMuscleTableFilterComposer f) f) {
    final $$SessionMuscleTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.sessionMuscle,
        getReferencedColumn: (t) => t.sessionId,
        builder: (joinBuilder, parentComposers) =>
            $$SessionMuscleTableFilterComposer(ComposerState($state.db,
                $state.db.sessionMuscle, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$SessionTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SessionTable> {
  $$SessionTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$WorkoutTableOrderingComposer get workoutId {
    final $$WorkoutTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $state.db.workout,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$WorkoutTableOrderingComposer(ComposerState(
                $state.db, $state.db.workout, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$MuscleTableInsertCompanionBuilder = MuscleCompanion Function({
  Value<int> id,
  required String name,
  required String color,
});
typedef $$MuscleTableUpdateCompanionBuilder = MuscleCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> color,
});

class $$MuscleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MuscleTable,
    MuscleData,
    $$MuscleTableFilterComposer,
    $$MuscleTableOrderingComposer,
    $$MuscleTableProcessedTableManager,
    $$MuscleTableInsertCompanionBuilder,
    $$MuscleTableUpdateCompanionBuilder> {
  $$MuscleTableTableManager(_$AppDatabase db, $MuscleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MuscleTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MuscleTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$MuscleTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> color = const Value.absent(),
          }) =>
              MuscleCompanion(
            id: id,
            name: name,
            color: color,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String color,
          }) =>
              MuscleCompanion.insert(
            id: id,
            name: name,
            color: color,
          ),
        ));
}

class $$MuscleTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $MuscleTable,
    MuscleData,
    $$MuscleTableFilterComposer,
    $$MuscleTableOrderingComposer,
    $$MuscleTableProcessedTableManager,
    $$MuscleTableInsertCompanionBuilder,
    $$MuscleTableUpdateCompanionBuilder> {
  $$MuscleTableProcessedTableManager(super.$state);
}

class $$MuscleTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MuscleTable> {
  $$MuscleTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter sessionMuscleRefs(
      ComposableFilter Function($$SessionMuscleTableFilterComposer f) f) {
    final $$SessionMuscleTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.sessionMuscle,
        getReferencedColumn: (t) => t.muscleId,
        builder: (joinBuilder, parentComposers) =>
            $$SessionMuscleTableFilterComposer(ComposerState($state.db,
                $state.db.sessionMuscle, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$MuscleTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MuscleTable> {
  $$MuscleTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ExerciseTableInsertCompanionBuilder = ExerciseCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$ExerciseTableUpdateCompanionBuilder = ExerciseCompanion Function({
  Value<int> id,
  Value<String> name,
});

class $$ExerciseTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExerciseTable,
    ExerciseData,
    $$ExerciseTableFilterComposer,
    $$ExerciseTableOrderingComposer,
    $$ExerciseTableProcessedTableManager,
    $$ExerciseTableInsertCompanionBuilder,
    $$ExerciseTableUpdateCompanionBuilder> {
  $$ExerciseTableTableManager(_$AppDatabase db, $ExerciseTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExerciseTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExerciseTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ExerciseTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              ExerciseCompanion(
            id: id,
            name: name,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              ExerciseCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$ExerciseTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ExerciseTable,
    ExerciseData,
    $$ExerciseTableFilterComposer,
    $$ExerciseTableOrderingComposer,
    $$ExerciseTableProcessedTableManager,
    $$ExerciseTableInsertCompanionBuilder,
    $$ExerciseTableUpdateCompanionBuilder> {
  $$ExerciseTableProcessedTableManager(super.$state);
}

class $$ExerciseTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ExerciseTable> {
  $$ExerciseTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter workoutExerciseRefs(
      ComposableFilter Function($$WorkoutExerciseTableFilterComposer f) f) {
    final $$WorkoutExerciseTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.workoutExercise,
            getReferencedColumn: (t) => t.exerciseId,
            builder: (joinBuilder, parentComposers) =>
                $$WorkoutExerciseTableFilterComposer(ComposerState($state.db,
                    $state.db.workoutExercise, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ExerciseTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ExerciseTable> {
  $$ExerciseTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$WorkoutExerciseTableInsertCompanionBuilder = WorkoutExerciseCompanion
    Function({
  Value<int?> workoutId,
  Value<int?> exerciseId,
  Value<int> rowid,
});
typedef $$WorkoutExerciseTableUpdateCompanionBuilder = WorkoutExerciseCompanion
    Function({
  Value<int?> workoutId,
  Value<int?> exerciseId,
  Value<int> rowid,
});

class $$WorkoutExerciseTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutExerciseTable,
    WorkoutExerciseData,
    $$WorkoutExerciseTableFilterComposer,
    $$WorkoutExerciseTableOrderingComposer,
    $$WorkoutExerciseTableProcessedTableManager,
    $$WorkoutExerciseTableInsertCompanionBuilder,
    $$WorkoutExerciseTableUpdateCompanionBuilder> {
  $$WorkoutExerciseTableTableManager(
      _$AppDatabase db, $WorkoutExerciseTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WorkoutExerciseTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WorkoutExerciseTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$WorkoutExerciseTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int?> workoutId = const Value.absent(),
            Value<int?> exerciseId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutExerciseCompanion(
            workoutId: workoutId,
            exerciseId: exerciseId,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> workoutId = const Value.absent(),
            Value<int?> exerciseId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutExerciseCompanion.insert(
            workoutId: workoutId,
            exerciseId: exerciseId,
            rowid: rowid,
          ),
        ));
}

class $$WorkoutExerciseTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $WorkoutExerciseTable,
    WorkoutExerciseData,
    $$WorkoutExerciseTableFilterComposer,
    $$WorkoutExerciseTableOrderingComposer,
    $$WorkoutExerciseTableProcessedTableManager,
    $$WorkoutExerciseTableInsertCompanionBuilder,
    $$WorkoutExerciseTableUpdateCompanionBuilder> {
  $$WorkoutExerciseTableProcessedTableManager(super.$state);
}

class $$WorkoutExerciseTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WorkoutExerciseTable> {
  $$WorkoutExerciseTableFilterComposer(super.$state);
  $$WorkoutTableFilterComposer get workoutId {
    final $$WorkoutTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $state.db.workout,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WorkoutTableFilterComposer(
            ComposerState(
                $state.db, $state.db.workout, joinBuilder, parentComposers)));
    return composer;
  }

  $$ExerciseTableFilterComposer get exerciseId {
    final $$ExerciseTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $state.db.exercise,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExerciseTableFilterComposer(ComposerState(
                $state.db, $state.db.exercise, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$WorkoutExerciseTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WorkoutExerciseTable> {
  $$WorkoutExerciseTableOrderingComposer(super.$state);
  $$WorkoutTableOrderingComposer get workoutId {
    final $$WorkoutTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $state.db.workout,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$WorkoutTableOrderingComposer(ComposerState(
                $state.db, $state.db.workout, joinBuilder, parentComposers)));
    return composer;
  }

  $$ExerciseTableOrderingComposer get exerciseId {
    final $$ExerciseTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $state.db.exercise,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExerciseTableOrderingComposer(ComposerState(
                $state.db, $state.db.exercise, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$SessionMuscleTableInsertCompanionBuilder = SessionMuscleCompanion
    Function({
  Value<int?> sessionId,
  Value<int?> muscleId,
  Value<int> rowid,
});
typedef $$SessionMuscleTableUpdateCompanionBuilder = SessionMuscleCompanion
    Function({
  Value<int?> sessionId,
  Value<int?> muscleId,
  Value<int> rowid,
});

class $$SessionMuscleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SessionMuscleTable,
    SessionMuscleData,
    $$SessionMuscleTableFilterComposer,
    $$SessionMuscleTableOrderingComposer,
    $$SessionMuscleTableProcessedTableManager,
    $$SessionMuscleTableInsertCompanionBuilder,
    $$SessionMuscleTableUpdateCompanionBuilder> {
  $$SessionMuscleTableTableManager(_$AppDatabase db, $SessionMuscleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SessionMuscleTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SessionMuscleTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$SessionMuscleTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int?> sessionId = const Value.absent(),
            Value<int?> muscleId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SessionMuscleCompanion(
            sessionId: sessionId,
            muscleId: muscleId,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> sessionId = const Value.absent(),
            Value<int?> muscleId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SessionMuscleCompanion.insert(
            sessionId: sessionId,
            muscleId: muscleId,
            rowid: rowid,
          ),
        ));
}

class $$SessionMuscleTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $SessionMuscleTable,
    SessionMuscleData,
    $$SessionMuscleTableFilterComposer,
    $$SessionMuscleTableOrderingComposer,
    $$SessionMuscleTableProcessedTableManager,
    $$SessionMuscleTableInsertCompanionBuilder,
    $$SessionMuscleTableUpdateCompanionBuilder> {
  $$SessionMuscleTableProcessedTableManager(super.$state);
}

class $$SessionMuscleTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SessionMuscleTable> {
  $$SessionMuscleTableFilterComposer(super.$state);
  $$SessionTableFilterComposer get sessionId {
    final $$SessionTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $state.db.session,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SessionTableFilterComposer(
            ComposerState(
                $state.db, $state.db.session, joinBuilder, parentComposers)));
    return composer;
  }

  $$MuscleTableFilterComposer get muscleId {
    final $$MuscleTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscleId,
        referencedTable: $state.db.muscle,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$MuscleTableFilterComposer(
            ComposerState(
                $state.db, $state.db.muscle, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$SessionMuscleTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SessionMuscleTable> {
  $$SessionMuscleTableOrderingComposer(super.$state);
  $$SessionTableOrderingComposer get sessionId {
    final $$SessionTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $state.db.session,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$SessionTableOrderingComposer(ComposerState(
                $state.db, $state.db.session, joinBuilder, parentComposers)));
    return composer;
  }

  $$MuscleTableOrderingComposer get muscleId {
    final $$MuscleTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscleId,
        referencedTable: $state.db.muscle,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MuscleTableOrderingComposer(ComposerState(
                $state.db, $state.db.muscle, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$WorkoutTableTableManager get workout =>
      $$WorkoutTableTableManager(_db, _db.workout);
  $$SessionTableTableManager get session =>
      $$SessionTableTableManager(_db, _db.session);
  $$MuscleTableTableManager get muscle =>
      $$MuscleTableTableManager(_db, _db.muscle);
  $$ExerciseTableTableManager get exercise =>
      $$ExerciseTableTableManager(_db, _db.exercise);
  $$WorkoutExerciseTableTableManager get workoutExercise =>
      $$WorkoutExerciseTableTableManager(_db, _db.workoutExercise);
  $$SessionMuscleTableTableManager get sessionMuscle =>
      $$SessionMuscleTableTableManager(_db, _db.sessionMuscle);
}
