// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ExerciseItemTable extends ExerciseItem
    with TableInfo<$ExerciseItemTable, ExerciseItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, label];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_item';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
    );
  }

  @override
  $ExerciseItemTable createAlias(String alias) {
    return $ExerciseItemTable(attachedDatabase, alias);
  }
}

class ExerciseItemData extends DataClass
    implements Insertable<ExerciseItemData> {
  final int id;
  final String label;
  const ExerciseItemData({required this.id, required this.label});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    return map;
  }

  ExerciseItemCompanion toCompanion(bool nullToAbsent) {
    return ExerciseItemCompanion(
      id: Value(id),
      label: Value(label),
    );
  }

  factory ExerciseItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseItemData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
    };
  }

  ExerciseItemData copyWith({int? id, String? label}) => ExerciseItemData(
        id: id ?? this.id,
        label: label ?? this.label,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseItemData(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseItemData &&
          other.id == this.id &&
          other.label == this.label);
}

class ExerciseItemCompanion extends UpdateCompanion<ExerciseItemData> {
  final Value<int> id;
  final Value<String> label;
  const ExerciseItemCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
  });
  ExerciseItemCompanion.insert({
    this.id = const Value.absent(),
    required String label,
  }) : label = Value(label);
  static Insertable<ExerciseItemData> custom({
    Expression<int>? id,
    Expression<String>? label,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
    });
  }

  ExerciseItemCompanion copyWith({Value<int>? id, Value<String>? label}) {
    return ExerciseItemCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseItemCompanion(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }
}

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
  static const VerificationMeta _exerciseItemIdMeta =
      const VerificationMeta('exerciseItemId');
  @override
  late final GeneratedColumn<int> exerciseItemId = GeneratedColumn<int>(
      'exercise_item_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercise_item (id)'));
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<int> workoutId = GeneratedColumn<int>(
      'workout_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES workout (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, exerciseItemId, workoutId];
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
    if (data.containsKey('exercise_item_id')) {
      context.handle(
          _exerciseItemIdMeta,
          exerciseItemId.isAcceptableOrUnknown(
              data['exercise_item_id']!, _exerciseItemIdMeta));
    }
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
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
      exerciseItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_item_id']),
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}workout_id']),
    );
  }

  @override
  $ExerciseTable createAlias(String alias) {
    return $ExerciseTable(attachedDatabase, alias);
  }
}

class ExerciseData extends DataClass implements Insertable<ExerciseData> {
  final int id;
  final int? exerciseItemId;
  final int? workoutId;
  const ExerciseData({required this.id, this.exerciseItemId, this.workoutId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || exerciseItemId != null) {
      map['exercise_item_id'] = Variable<int>(exerciseItemId);
    }
    if (!nullToAbsent || workoutId != null) {
      map['workout_id'] = Variable<int>(workoutId);
    }
    return map;
  }

  ExerciseCompanion toCompanion(bool nullToAbsent) {
    return ExerciseCompanion(
      id: Value(id),
      exerciseItemId: exerciseItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseItemId),
      workoutId: workoutId == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutId),
    );
  }

  factory ExerciseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseData(
      id: serializer.fromJson<int>(json['id']),
      exerciseItemId: serializer.fromJson<int?>(json['exerciseItemId']),
      workoutId: serializer.fromJson<int?>(json['workoutId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'exerciseItemId': serializer.toJson<int?>(exerciseItemId),
      'workoutId': serializer.toJson<int?>(workoutId),
    };
  }

  ExerciseData copyWith(
          {int? id,
          Value<int?> exerciseItemId = const Value.absent(),
          Value<int?> workoutId = const Value.absent()}) =>
      ExerciseData(
        id: id ?? this.id,
        exerciseItemId:
            exerciseItemId.present ? exerciseItemId.value : this.exerciseItemId,
        workoutId: workoutId.present ? workoutId.value : this.workoutId,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseData(')
          ..write('id: $id, ')
          ..write('exerciseItemId: $exerciseItemId, ')
          ..write('workoutId: $workoutId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, exerciseItemId, workoutId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseData &&
          other.id == this.id &&
          other.exerciseItemId == this.exerciseItemId &&
          other.workoutId == this.workoutId);
}

class ExerciseCompanion extends UpdateCompanion<ExerciseData> {
  final Value<int> id;
  final Value<int?> exerciseItemId;
  final Value<int?> workoutId;
  const ExerciseCompanion({
    this.id = const Value.absent(),
    this.exerciseItemId = const Value.absent(),
    this.workoutId = const Value.absent(),
  });
  ExerciseCompanion.insert({
    this.id = const Value.absent(),
    this.exerciseItemId = const Value.absent(),
    this.workoutId = const Value.absent(),
  });
  static Insertable<ExerciseData> custom({
    Expression<int>? id,
    Expression<int>? exerciseItemId,
    Expression<int>? workoutId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exerciseItemId != null) 'exercise_item_id': exerciseItemId,
      if (workoutId != null) 'workout_id': workoutId,
    });
  }

  ExerciseCompanion copyWith(
      {Value<int>? id, Value<int?>? exerciseItemId, Value<int?>? workoutId}) {
    return ExerciseCompanion(
      id: id ?? this.id,
      exerciseItemId: exerciseItemId ?? this.exerciseItemId,
      workoutId: workoutId ?? this.workoutId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (exerciseItemId.present) {
      map['exercise_item_id'] = Variable<int>(exerciseItemId.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<int>(workoutId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseCompanion(')
          ..write('id: $id, ')
          ..write('exerciseItemId: $exerciseItemId, ')
          ..write('workoutId: $workoutId')
          ..write(')'))
        .toString();
  }
}

class $SetWorkoutTable extends SetWorkout
    with TableInfo<$SetWorkoutTable, SetWorkoutData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SetWorkoutTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercise (id)'));
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
      'points', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(
      'weight', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _setNumberMeta =
      const VerificationMeta('setNumber');
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
      'set_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, exerciseId, points, weight, type, setNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'set_workout';
  @override
  VerificationContext validateIntegrity(Insertable<SetWorkoutData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    }
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    } else if (isInserting) {
      context.missing(_pointsMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(_setNumberMeta,
          setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta));
    } else if (isInserting) {
      context.missing(_setNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SetWorkoutData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SetWorkoutData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_id']),
      points: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}points'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weight'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      setNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}set_number'])!,
    );
  }

  @override
  $SetWorkoutTable createAlias(String alias) {
    return $SetWorkoutTable(attachedDatabase, alias);
  }
}

class SetWorkoutData extends DataClass implements Insertable<SetWorkoutData> {
  final int id;
  final int? exerciseId;
  final int points;
  final int weight;
  final String type;
  final int setNumber;
  const SetWorkoutData(
      {required this.id,
      this.exerciseId,
      required this.points,
      required this.weight,
      required this.type,
      required this.setNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || exerciseId != null) {
      map['exercise_id'] = Variable<int>(exerciseId);
    }
    map['points'] = Variable<int>(points);
    map['weight'] = Variable<int>(weight);
    map['type'] = Variable<String>(type);
    map['set_number'] = Variable<int>(setNumber);
    return map;
  }

  SetWorkoutCompanion toCompanion(bool nullToAbsent) {
    return SetWorkoutCompanion(
      id: Value(id),
      exerciseId: exerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseId),
      points: Value(points),
      weight: Value(weight),
      type: Value(type),
      setNumber: Value(setNumber),
    );
  }

  factory SetWorkoutData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SetWorkoutData(
      id: serializer.fromJson<int>(json['id']),
      exerciseId: serializer.fromJson<int?>(json['exerciseId']),
      points: serializer.fromJson<int>(json['points']),
      weight: serializer.fromJson<int>(json['weight']),
      type: serializer.fromJson<String>(json['type']),
      setNumber: serializer.fromJson<int>(json['setNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'exerciseId': serializer.toJson<int?>(exerciseId),
      'points': serializer.toJson<int>(points),
      'weight': serializer.toJson<int>(weight),
      'type': serializer.toJson<String>(type),
      'setNumber': serializer.toJson<int>(setNumber),
    };
  }

  SetWorkoutData copyWith(
          {int? id,
          Value<int?> exerciseId = const Value.absent(),
          int? points,
          int? weight,
          String? type,
          int? setNumber}) =>
      SetWorkoutData(
        id: id ?? this.id,
        exerciseId: exerciseId.present ? exerciseId.value : this.exerciseId,
        points: points ?? this.points,
        weight: weight ?? this.weight,
        type: type ?? this.type,
        setNumber: setNumber ?? this.setNumber,
      );
  @override
  String toString() {
    return (StringBuffer('SetWorkoutData(')
          ..write('id: $id, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('points: $points, ')
          ..write('weight: $weight, ')
          ..write('type: $type, ')
          ..write('setNumber: $setNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, exerciseId, points, weight, type, setNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SetWorkoutData &&
          other.id == this.id &&
          other.exerciseId == this.exerciseId &&
          other.points == this.points &&
          other.weight == this.weight &&
          other.type == this.type &&
          other.setNumber == this.setNumber);
}

class SetWorkoutCompanion extends UpdateCompanion<SetWorkoutData> {
  final Value<int> id;
  final Value<int?> exerciseId;
  final Value<int> points;
  final Value<int> weight;
  final Value<String> type;
  final Value<int> setNumber;
  const SetWorkoutCompanion({
    this.id = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.points = const Value.absent(),
    this.weight = const Value.absent(),
    this.type = const Value.absent(),
    this.setNumber = const Value.absent(),
  });
  SetWorkoutCompanion.insert({
    this.id = const Value.absent(),
    this.exerciseId = const Value.absent(),
    required int points,
    required int weight,
    required String type,
    required int setNumber,
  })  : points = Value(points),
        weight = Value(weight),
        type = Value(type),
        setNumber = Value(setNumber);
  static Insertable<SetWorkoutData> custom({
    Expression<int>? id,
    Expression<int>? exerciseId,
    Expression<int>? points,
    Expression<int>? weight,
    Expression<String>? type,
    Expression<int>? setNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (points != null) 'points': points,
      if (weight != null) 'weight': weight,
      if (type != null) 'type': type,
      if (setNumber != null) 'set_number': setNumber,
    });
  }

  SetWorkoutCompanion copyWith(
      {Value<int>? id,
      Value<int?>? exerciseId,
      Value<int>? points,
      Value<int>? weight,
      Value<String>? type,
      Value<int>? setNumber}) {
    return SetWorkoutCompanion(
      id: id ?? this.id,
      exerciseId: exerciseId ?? this.exerciseId,
      points: points ?? this.points,
      weight: weight ?? this.weight,
      type: type ?? this.type,
      setNumber: setNumber ?? this.setNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SetWorkoutCompanion(')
          ..write('id: $id, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('points: $points, ')
          ..write('weight: $weight, ')
          ..write('type: $type, ')
          ..write('setNumber: $setNumber')
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
  static const VerificationMeta _nameSessionMeta =
      const VerificationMeta('nameSession');
  @override
  late final GeneratedColumn<String> nameSession = GeneratedColumn<String>(
      'name_session', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<int> workoutId = GeneratedColumn<int>(
      'workout_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES workout (id)'));
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nameSession, workoutId, startTime, endTime];
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
    if (data.containsKey('name_session')) {
      context.handle(
          _nameSessionMeta,
          nameSession.isAcceptableOrUnknown(
              data['name_session']!, _nameSessionMeta));
    } else if (isInserting) {
      context.missing(_nameSessionMeta);
    }
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
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
      nameSession: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_session'])!,
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}workout_id']),
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time'])!,
    );
  }

  @override
  $SessionTable createAlias(String alias) {
    return $SessionTable(attachedDatabase, alias);
  }
}

class SessionData extends DataClass implements Insertable<SessionData> {
  final int id;
  final String nameSession;
  final int? workoutId;
  final DateTime startTime;
  final DateTime endTime;
  const SessionData(
      {required this.id,
      required this.nameSession,
      this.workoutId,
      required this.startTime,
      required this.endTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_session'] = Variable<String>(nameSession);
    if (!nullToAbsent || workoutId != null) {
      map['workout_id'] = Variable<int>(workoutId);
    }
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    return map;
  }

  SessionCompanion toCompanion(bool nullToAbsent) {
    return SessionCompanion(
      id: Value(id),
      nameSession: Value(nameSession),
      workoutId: workoutId == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutId),
      startTime: Value(startTime),
      endTime: Value(endTime),
    );
  }

  factory SessionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionData(
      id: serializer.fromJson<int>(json['id']),
      nameSession: serializer.fromJson<String>(json['nameSession']),
      workoutId: serializer.fromJson<int?>(json['workoutId']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameSession': serializer.toJson<String>(nameSession),
      'workoutId': serializer.toJson<int?>(workoutId),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
    };
  }

  SessionData copyWith(
          {int? id,
          String? nameSession,
          Value<int?> workoutId = const Value.absent(),
          DateTime? startTime,
          DateTime? endTime}) =>
      SessionData(
        id: id ?? this.id,
        nameSession: nameSession ?? this.nameSession,
        workoutId: workoutId.present ? workoutId.value : this.workoutId,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );
  @override
  String toString() {
    return (StringBuffer('SessionData(')
          ..write('id: $id, ')
          ..write('nameSession: $nameSession, ')
          ..write('workoutId: $workoutId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nameSession, workoutId, startTime, endTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionData &&
          other.id == this.id &&
          other.nameSession == this.nameSession &&
          other.workoutId == this.workoutId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime);
}

class SessionCompanion extends UpdateCompanion<SessionData> {
  final Value<int> id;
  final Value<String> nameSession;
  final Value<int?> workoutId;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  const SessionCompanion({
    this.id = const Value.absent(),
    this.nameSession = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
  });
  SessionCompanion.insert({
    this.id = const Value.absent(),
    required String nameSession,
    this.workoutId = const Value.absent(),
    required DateTime startTime,
    required DateTime endTime,
  })  : nameSession = Value(nameSession),
        startTime = Value(startTime),
        endTime = Value(endTime);
  static Insertable<SessionData> custom({
    Expression<int>? id,
    Expression<String>? nameSession,
    Expression<int>? workoutId,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameSession != null) 'name_session': nameSession,
      if (workoutId != null) 'workout_id': workoutId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
    });
  }

  SessionCompanion copyWith(
      {Value<int>? id,
      Value<String>? nameSession,
      Value<int?>? workoutId,
      Value<DateTime>? startTime,
      Value<DateTime>? endTime}) {
    return SessionCompanion(
      id: id ?? this.id,
      nameSession: nameSession ?? this.nameSession,
      workoutId: workoutId ?? this.workoutId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nameSession.present) {
      map['name_session'] = Variable<String>(nameSession.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<int>(workoutId.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionCompanion(')
          ..write('id: $id, ')
          ..write('nameSession: $nameSession, ')
          ..write('workoutId: $workoutId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
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

class $ExerciseItemMuscleTable extends ExerciseItemMuscle
    with TableInfo<$ExerciseItemMuscleTable, ExerciseItemMuscleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseItemMuscleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercise_item (id)'));
  static const VerificationMeta _muscleIdMeta =
      const VerificationMeta('muscleId');
  @override
  late final GeneratedColumn<int> muscleId = GeneratedColumn<int>(
      'muscle_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES muscle (id)'));
  static const VerificationMeta _percentageMeta =
      const VerificationMeta('percentage');
  @override
  late final GeneratedColumn<double> percentage = GeneratedColumn<double>(
      'percentage', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [exerciseId, muscleId, percentage];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_item_muscle';
  @override
  VerificationContext validateIntegrity(
      Insertable<ExerciseItemMuscleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    }
    if (data.containsKey('muscle_id')) {
      context.handle(_muscleIdMeta,
          muscleId.isAcceptableOrUnknown(data['muscle_id']!, _muscleIdMeta));
    }
    if (data.containsKey('percentage')) {
      context.handle(
          _percentageMeta,
          percentage.isAcceptableOrUnknown(
              data['percentage']!, _percentageMeta));
    } else if (isInserting) {
      context.missing(_percentageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ExerciseItemMuscleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseItemMuscleData(
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_id']),
      muscleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}muscle_id']),
      percentage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}percentage'])!,
    );
  }

  @override
  $ExerciseItemMuscleTable createAlias(String alias) {
    return $ExerciseItemMuscleTable(attachedDatabase, alias);
  }
}

class ExerciseItemMuscleData extends DataClass
    implements Insertable<ExerciseItemMuscleData> {
  final int? exerciseId;
  final int? muscleId;
  final double percentage;
  const ExerciseItemMuscleData(
      {this.exerciseId, this.muscleId, required this.percentage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || exerciseId != null) {
      map['exercise_id'] = Variable<int>(exerciseId);
    }
    if (!nullToAbsent || muscleId != null) {
      map['muscle_id'] = Variable<int>(muscleId);
    }
    map['percentage'] = Variable<double>(percentage);
    return map;
  }

  ExerciseItemMuscleCompanion toCompanion(bool nullToAbsent) {
    return ExerciseItemMuscleCompanion(
      exerciseId: exerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseId),
      muscleId: muscleId == null && nullToAbsent
          ? const Value.absent()
          : Value(muscleId),
      percentage: Value(percentage),
    );
  }

  factory ExerciseItemMuscleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseItemMuscleData(
      exerciseId: serializer.fromJson<int?>(json['exerciseId']),
      muscleId: serializer.fromJson<int?>(json['muscleId']),
      percentage: serializer.fromJson<double>(json['percentage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'exerciseId': serializer.toJson<int?>(exerciseId),
      'muscleId': serializer.toJson<int?>(muscleId),
      'percentage': serializer.toJson<double>(percentage),
    };
  }

  ExerciseItemMuscleData copyWith(
          {Value<int?> exerciseId = const Value.absent(),
          Value<int?> muscleId = const Value.absent(),
          double? percentage}) =>
      ExerciseItemMuscleData(
        exerciseId: exerciseId.present ? exerciseId.value : this.exerciseId,
        muscleId: muscleId.present ? muscleId.value : this.muscleId,
        percentage: percentage ?? this.percentage,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseItemMuscleData(')
          ..write('exerciseId: $exerciseId, ')
          ..write('muscleId: $muscleId, ')
          ..write('percentage: $percentage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(exerciseId, muscleId, percentage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseItemMuscleData &&
          other.exerciseId == this.exerciseId &&
          other.muscleId == this.muscleId &&
          other.percentage == this.percentage);
}

class ExerciseItemMuscleCompanion
    extends UpdateCompanion<ExerciseItemMuscleData> {
  final Value<int?> exerciseId;
  final Value<int?> muscleId;
  final Value<double> percentage;
  final Value<int> rowid;
  const ExerciseItemMuscleCompanion({
    this.exerciseId = const Value.absent(),
    this.muscleId = const Value.absent(),
    this.percentage = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseItemMuscleCompanion.insert({
    this.exerciseId = const Value.absent(),
    this.muscleId = const Value.absent(),
    required double percentage,
    this.rowid = const Value.absent(),
  }) : percentage = Value(percentage);
  static Insertable<ExerciseItemMuscleData> custom({
    Expression<int>? exerciseId,
    Expression<int>? muscleId,
    Expression<double>? percentage,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (muscleId != null) 'muscle_id': muscleId,
      if (percentage != null) 'percentage': percentage,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseItemMuscleCompanion copyWith(
      {Value<int?>? exerciseId,
      Value<int?>? muscleId,
      Value<double>? percentage,
      Value<int>? rowid}) {
    return ExerciseItemMuscleCompanion(
      exerciseId: exerciseId ?? this.exerciseId,
      muscleId: muscleId ?? this.muscleId,
      percentage: percentage ?? this.percentage,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (muscleId.present) {
      map['muscle_id'] = Variable<int>(muscleId.value);
    }
    if (percentage.present) {
      map['percentage'] = Variable<double>(percentage.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseItemMuscleCompanion(')
          ..write('exerciseId: $exerciseId, ')
          ..write('muscleId: $muscleId, ')
          ..write('percentage: $percentage, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $ExerciseItemTable exerciseItem = $ExerciseItemTable(this);
  late final $WorkoutTable workout = $WorkoutTable(this);
  late final $ExerciseTable exercise = $ExerciseTable(this);
  late final $SetWorkoutTable setWorkout = $SetWorkoutTable(this);
  late final $SessionTable session = $SessionTable(this);
  late final $MuscleTable muscle = $MuscleTable(this);
  late final $ExerciseItemMuscleTable exerciseItemMuscle =
      $ExerciseItemMuscleTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        exerciseItem,
        workout,
        exercise,
        setWorkout,
        session,
        muscle,
        exerciseItemMuscle
      ];
}

typedef $$ExerciseItemTableInsertCompanionBuilder = ExerciseItemCompanion
    Function({
  Value<int> id,
  required String label,
});
typedef $$ExerciseItemTableUpdateCompanionBuilder = ExerciseItemCompanion
    Function({
  Value<int> id,
  Value<String> label,
});

class $$ExerciseItemTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExerciseItemTable,
    ExerciseItemData,
    $$ExerciseItemTableFilterComposer,
    $$ExerciseItemTableOrderingComposer,
    $$ExerciseItemTableProcessedTableManager,
    $$ExerciseItemTableInsertCompanionBuilder,
    $$ExerciseItemTableUpdateCompanionBuilder> {
  $$ExerciseItemTableTableManager(_$AppDatabase db, $ExerciseItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExerciseItemTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExerciseItemTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ExerciseItemTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> label = const Value.absent(),
          }) =>
              ExerciseItemCompanion(
            id: id,
            label: label,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String label,
          }) =>
              ExerciseItemCompanion.insert(
            id: id,
            label: label,
          ),
        ));
}

class $$ExerciseItemTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ExerciseItemTable,
    ExerciseItemData,
    $$ExerciseItemTableFilterComposer,
    $$ExerciseItemTableOrderingComposer,
    $$ExerciseItemTableProcessedTableManager,
    $$ExerciseItemTableInsertCompanionBuilder,
    $$ExerciseItemTableUpdateCompanionBuilder> {
  $$ExerciseItemTableProcessedTableManager(super.$state);
}

class $$ExerciseItemTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ExerciseItemTable> {
  $$ExerciseItemTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get label => $state.composableBuilder(
      column: $state.table.label,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter exerciseRefs(
      ComposableFilter Function($$ExerciseTableFilterComposer f) f) {
    final $$ExerciseTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.exercise,
        getReferencedColumn: (t) => t.exerciseItemId,
        builder: (joinBuilder, parentComposers) =>
            $$ExerciseTableFilterComposer(ComposerState(
                $state.db, $state.db.exercise, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter exerciseItemMuscleRefs(
      ComposableFilter Function($$ExerciseItemMuscleTableFilterComposer f) f) {
    final $$ExerciseItemMuscleTableFilterComposer composer = $state
        .composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.exerciseItemMuscle,
            getReferencedColumn: (t) => t.exerciseId,
            builder: (joinBuilder, parentComposers) =>
                $$ExerciseItemMuscleTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.exerciseItemMuscle,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$ExerciseItemTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ExerciseItemTable> {
  $$ExerciseItemTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get label => $state.composableBuilder(
      column: $state.table.label,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
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

  ComposableFilter exerciseRefs(
      ComposableFilter Function($$ExerciseTableFilterComposer f) f) {
    final $$ExerciseTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.exercise,
        getReferencedColumn: (t) => t.workoutId,
        builder: (joinBuilder, parentComposers) =>
            $$ExerciseTableFilterComposer(ComposerState(
                $state.db, $state.db.exercise, joinBuilder, parentComposers)));
    return f(composer);
  }

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

typedef $$ExerciseTableInsertCompanionBuilder = ExerciseCompanion Function({
  Value<int> id,
  Value<int?> exerciseItemId,
  Value<int?> workoutId,
});
typedef $$ExerciseTableUpdateCompanionBuilder = ExerciseCompanion Function({
  Value<int> id,
  Value<int?> exerciseItemId,
  Value<int?> workoutId,
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
            Value<int?> exerciseItemId = const Value.absent(),
            Value<int?> workoutId = const Value.absent(),
          }) =>
              ExerciseCompanion(
            id: id,
            exerciseItemId: exerciseItemId,
            workoutId: workoutId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int?> exerciseItemId = const Value.absent(),
            Value<int?> workoutId = const Value.absent(),
          }) =>
              ExerciseCompanion.insert(
            id: id,
            exerciseItemId: exerciseItemId,
            workoutId: workoutId,
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

  $$ExerciseItemTableFilterComposer get exerciseItemId {
    final $$ExerciseItemTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseItemId,
        referencedTable: $state.db.exerciseItem,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExerciseItemTableFilterComposer(ComposerState($state.db,
                $state.db.exerciseItem, joinBuilder, parentComposers)));
    return composer;
  }

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

  ComposableFilter setWorkoutRefs(
      ComposableFilter Function($$SetWorkoutTableFilterComposer f) f) {
    final $$SetWorkoutTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.setWorkout,
        getReferencedColumn: (t) => t.exerciseId,
        builder: (joinBuilder, parentComposers) =>
            $$SetWorkoutTableFilterComposer(ComposerState($state.db,
                $state.db.setWorkout, joinBuilder, parentComposers)));
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

  $$ExerciseItemTableOrderingComposer get exerciseItemId {
    final $$ExerciseItemTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseItemId,
        referencedTable: $state.db.exerciseItem,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExerciseItemTableOrderingComposer(ComposerState($state.db,
                $state.db.exerciseItem, joinBuilder, parentComposers)));
    return composer;
  }

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

typedef $$SetWorkoutTableInsertCompanionBuilder = SetWorkoutCompanion Function({
  Value<int> id,
  Value<int?> exerciseId,
  required int points,
  required int weight,
  required String type,
  required int setNumber,
});
typedef $$SetWorkoutTableUpdateCompanionBuilder = SetWorkoutCompanion Function({
  Value<int> id,
  Value<int?> exerciseId,
  Value<int> points,
  Value<int> weight,
  Value<String> type,
  Value<int> setNumber,
});

class $$SetWorkoutTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SetWorkoutTable,
    SetWorkoutData,
    $$SetWorkoutTableFilterComposer,
    $$SetWorkoutTableOrderingComposer,
    $$SetWorkoutTableProcessedTableManager,
    $$SetWorkoutTableInsertCompanionBuilder,
    $$SetWorkoutTableUpdateCompanionBuilder> {
  $$SetWorkoutTableTableManager(_$AppDatabase db, $SetWorkoutTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SetWorkoutTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SetWorkoutTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$SetWorkoutTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int?> exerciseId = const Value.absent(),
            Value<int> points = const Value.absent(),
            Value<int> weight = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int> setNumber = const Value.absent(),
          }) =>
              SetWorkoutCompanion(
            id: id,
            exerciseId: exerciseId,
            points: points,
            weight: weight,
            type: type,
            setNumber: setNumber,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int?> exerciseId = const Value.absent(),
            required int points,
            required int weight,
            required String type,
            required int setNumber,
          }) =>
              SetWorkoutCompanion.insert(
            id: id,
            exerciseId: exerciseId,
            points: points,
            weight: weight,
            type: type,
            setNumber: setNumber,
          ),
        ));
}

class $$SetWorkoutTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $SetWorkoutTable,
    SetWorkoutData,
    $$SetWorkoutTableFilterComposer,
    $$SetWorkoutTableOrderingComposer,
    $$SetWorkoutTableProcessedTableManager,
    $$SetWorkoutTableInsertCompanionBuilder,
    $$SetWorkoutTableUpdateCompanionBuilder> {
  $$SetWorkoutTableProcessedTableManager(super.$state);
}

class $$SetWorkoutTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SetWorkoutTable> {
  $$SetWorkoutTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get points => $state.composableBuilder(
      column: $state.table.points,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get setNumber => $state.composableBuilder(
      column: $state.table.setNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

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

class $$SetWorkoutTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SetWorkoutTable> {
  $$SetWorkoutTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get points => $state.composableBuilder(
      column: $state.table.points,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get setNumber => $state.composableBuilder(
      column: $state.table.setNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

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

typedef $$SessionTableInsertCompanionBuilder = SessionCompanion Function({
  Value<int> id,
  required String nameSession,
  Value<int?> workoutId,
  required DateTime startTime,
  required DateTime endTime,
});
typedef $$SessionTableUpdateCompanionBuilder = SessionCompanion Function({
  Value<int> id,
  Value<String> nameSession,
  Value<int?> workoutId,
  Value<DateTime> startTime,
  Value<DateTime> endTime,
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
            Value<String> nameSession = const Value.absent(),
            Value<int?> workoutId = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<DateTime> endTime = const Value.absent(),
          }) =>
              SessionCompanion(
            id: id,
            nameSession: nameSession,
            workoutId: workoutId,
            startTime: startTime,
            endTime: endTime,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String nameSession,
            Value<int?> workoutId = const Value.absent(),
            required DateTime startTime,
            required DateTime endTime,
          }) =>
              SessionCompanion.insert(
            id: id,
            nameSession: nameSession,
            workoutId: workoutId,
            startTime: startTime,
            endTime: endTime,
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

  ColumnFilters<String> get nameSession => $state.composableBuilder(
      column: $state.table.nameSession,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
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
}

class $$SessionTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SessionTable> {
  $$SessionTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameSession => $state.composableBuilder(
      column: $state.table.nameSession,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
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

  ComposableFilter exerciseItemMuscleRefs(
      ComposableFilter Function($$ExerciseItemMuscleTableFilterComposer f) f) {
    final $$ExerciseItemMuscleTableFilterComposer composer = $state
        .composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.exerciseItemMuscle,
            getReferencedColumn: (t) => t.muscleId,
            builder: (joinBuilder, parentComposers) =>
                $$ExerciseItemMuscleTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.exerciseItemMuscle,
                    joinBuilder,
                    parentComposers)));
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

typedef $$ExerciseItemMuscleTableInsertCompanionBuilder
    = ExerciseItemMuscleCompanion Function({
  Value<int?> exerciseId,
  Value<int?> muscleId,
  required double percentage,
  Value<int> rowid,
});
typedef $$ExerciseItemMuscleTableUpdateCompanionBuilder
    = ExerciseItemMuscleCompanion Function({
  Value<int?> exerciseId,
  Value<int?> muscleId,
  Value<double> percentage,
  Value<int> rowid,
});

class $$ExerciseItemMuscleTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExerciseItemMuscleTable,
    ExerciseItemMuscleData,
    $$ExerciseItemMuscleTableFilterComposer,
    $$ExerciseItemMuscleTableOrderingComposer,
    $$ExerciseItemMuscleTableProcessedTableManager,
    $$ExerciseItemMuscleTableInsertCompanionBuilder,
    $$ExerciseItemMuscleTableUpdateCompanionBuilder> {
  $$ExerciseItemMuscleTableTableManager(
      _$AppDatabase db, $ExerciseItemMuscleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExerciseItemMuscleTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$ExerciseItemMuscleTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ExerciseItemMuscleTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int?> exerciseId = const Value.absent(),
            Value<int?> muscleId = const Value.absent(),
            Value<double> percentage = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExerciseItemMuscleCompanion(
            exerciseId: exerciseId,
            muscleId: muscleId,
            percentage: percentage,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> exerciseId = const Value.absent(),
            Value<int?> muscleId = const Value.absent(),
            required double percentage,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExerciseItemMuscleCompanion.insert(
            exerciseId: exerciseId,
            muscleId: muscleId,
            percentage: percentage,
            rowid: rowid,
          ),
        ));
}

class $$ExerciseItemMuscleTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $ExerciseItemMuscleTable,
        ExerciseItemMuscleData,
        $$ExerciseItemMuscleTableFilterComposer,
        $$ExerciseItemMuscleTableOrderingComposer,
        $$ExerciseItemMuscleTableProcessedTableManager,
        $$ExerciseItemMuscleTableInsertCompanionBuilder,
        $$ExerciseItemMuscleTableUpdateCompanionBuilder> {
  $$ExerciseItemMuscleTableProcessedTableManager(super.$state);
}

class $$ExerciseItemMuscleTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ExerciseItemMuscleTable> {
  $$ExerciseItemMuscleTableFilterComposer(super.$state);
  ColumnFilters<double> get percentage => $state.composableBuilder(
      column: $state.table.percentage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ExerciseItemTableFilterComposer get exerciseId {
    final $$ExerciseItemTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $state.db.exerciseItem,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExerciseItemTableFilterComposer(ComposerState($state.db,
                $state.db.exerciseItem, joinBuilder, parentComposers)));
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

class $$ExerciseItemMuscleTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ExerciseItemMuscleTable> {
  $$ExerciseItemMuscleTableOrderingComposer(super.$state);
  ColumnOrderings<double> get percentage => $state.composableBuilder(
      column: $state.table.percentage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ExerciseItemTableOrderingComposer get exerciseId {
    final $$ExerciseItemTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $state.db.exerciseItem,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExerciseItemTableOrderingComposer(ComposerState($state.db,
                $state.db.exerciseItem, joinBuilder, parentComposers)));
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
  $$ExerciseItemTableTableManager get exerciseItem =>
      $$ExerciseItemTableTableManager(_db, _db.exerciseItem);
  $$WorkoutTableTableManager get workout =>
      $$WorkoutTableTableManager(_db, _db.workout);
  $$ExerciseTableTableManager get exercise =>
      $$ExerciseTableTableManager(_db, _db.exercise);
  $$SetWorkoutTableTableManager get setWorkout =>
      $$SetWorkoutTableTableManager(_db, _db.setWorkout);
  $$SessionTableTableManager get session =>
      $$SessionTableTableManager(_db, _db.session);
  $$MuscleTableTableManager get muscle =>
      $$MuscleTableTableManager(_db, _db.muscle);
  $$ExerciseItemMuscleTableTableManager get exerciseItemMuscle =>
      $$ExerciseItemMuscleTableTableManager(_db, _db.exerciseItemMuscle);
}
