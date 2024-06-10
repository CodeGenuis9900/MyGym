import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygym/src/bloc/event/exercise.event.dart';
import 'package:mygym/src/bloc/exercise.bloc.dart';
import 'package:mygym/src/bloc/state/exercise.state.dart';
import 'package:mygym/src/bloc/state/workout.shared.id.state.dart';
import 'package:mygym/src/bloc/workout.shared.id.bloc.dart';
import 'package:mygym/src/data/repositories/database.dart';
import 'package:mygym/src/presentation/pages/set.workout.page.dart';

class ExerciseItem {
  final String id;
  final String label;

  ExerciseItem({required this.id, required this.label});
}

class Exercise {
  final ExerciseItem exerciseItem;
  final int points;
  int repetitions;

  Exercise(
      {required this.exerciseItem,
      required this.points,
      required this.repetitions});
}

class ExerciseListPage extends StatefulWidget {
  @override
  _ExerciseListPageState createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  List<Exercise> exercises = [
    Exercise(
      exerciseItem: ExerciseItem(id: '1', label: 'Push Ups'),
      points: 10,
      repetitions: 20,
    ),
    Exercise(
      exerciseItem: ExerciseItem(id: '2', label: 'Sit Ups'),
      points: 8,
      repetitions: 15,
    ),
    Exercise(
      exerciseItem: ExerciseItem(id: '3', label: 'Squats'),
      points: 12,
      repetitions: 25,
    ),
  ];

  void _deleteExercise(int index) {
    setState(() {
      exercises.removeAt(index);
    });
  }

  void _editExercise(int index) {
    setState(() {
      exercises[index].repetitions += 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    final workoutId =
        (context.read<WorkoutIdBloc>().state as WorkoutIdSelected).workoutId;
    return Scaffold(
        body: BlocProvider(
      create: (context) => ExerciseBloc(context.read<AppDatabase>())
        ..add(LoadExerciseByWorkoutId(workoutId)),
      child:
          BlocBuilder<ExerciseBloc, ExerciseState>(builder: (context, state) {
        if (state is ExerciseLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExerciseLoaded) {
          final sessions = state.exercises;
          if (sessions.isEmpty) {
            return const Center(child: Text('No session found'));
          } else {
            return ListView.builder(
              itemCount: sessions.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Text("hhh"),
                );
              },
            );
          }
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      }),
    ));
  }
}
