import 'package:flutter/material.dart';

void main() {
  runApp(ExerciseListPage());
}

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

class ExerciseListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExerciseListScreen(),
    );
  }
}

class ExerciseListScreen extends StatefulWidget {
  @override
  _ExerciseListScreenState createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
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
    return Scaffold(
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(exercises[index].exerciseItem.label),
              subtitle: Text(
                  'Points: ${exercises[index].points}, Repetitions: ${exercises[index].repetitions}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editExercise(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteExercise(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
