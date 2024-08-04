import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygym/src/bloc/event/exercise.event.dart';
import 'package:mygym/src/bloc/exercise.bloc.dart';
import 'package:mygym/src/bloc/set.bloc.dart';
import 'package:mygym/src/bloc/state/exercise.state.dart';
import 'package:mygym/src/bloc/state/workout.shared.id.state.dart';
import 'package:mygym/src/bloc/workout.shared.id.bloc.dart';
import 'package:mygym/src/data/repositories/database.dart';
import 'package:mygym/src/presentation/card/exercise.card.dart';
import 'package:mygym/src/presentation/modal/add.exercise.modal.dart';
import 'package:mygym/src/presentation/widgets/custom.button.dart';

import '../../utils/app.colors.dart';

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
  /*void _deleteExercise(int index) {
    setState(() {
      exercises.removeAt(index);
    });
  }

  void _editExercise(int index) {
    setState(() {
      exercises[index].repetitions += 5;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final workoutId =
        (context.read<WorkoutIdBloc>().state as WorkoutIdSelected).workoutId;
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            ExerciseBloc(context.read<AppDatabase>(), context.read<SetBloc>())
              ..add(LoadExerciseByWorkoutId(workoutId)),
        child:
            BlocBuilder<ExerciseBloc, ExerciseState>(builder: (context, state) {
          if (state is ExerciseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExerciseWithItemLoaded) {
            final exercises = state.exercisesWithItems;
            if (exercises.isEmpty) {
              return const Center(child: Text('No session found'));
            } else {
              return ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExerciseCard(
                    exerciseItem: exercises[index].exerciseItem!.label,
                    onTap: () {},
                  );
                },
              );
            }
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: 30.0, right: 20.0, left: 20.0, top: 10),
        child: CustomButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  content: AddExerciseModal(),
                );
              },
            );
          },
          text: 'Add exercise',
          outlined: false,
          color: AppColors.blueV0,
        ),
      ),
    );
  }
}
