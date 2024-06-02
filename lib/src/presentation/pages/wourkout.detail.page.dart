import 'package:flutter/material.dart';
import 'package:mygym/src/presentation/pages/exercise.list.page.dart';
import 'package:mygym/src/data/repositories/database.dart';
import 'package:mygym/src/presentation/pages/muscle.page.dart';
import 'package:mygym/src/presentation/pages/session.page.dart';

import '../widgets/tab.bar.with.pages.widget.dart';
import 'overview.page.dart';

class WorkoutDetailPage extends StatefulWidget {
  final WorkoutData workout;

  const WorkoutDetailPage({super.key, required this.workout});

  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout.name),
      ),
      body: TabBarWithPages(
        tabNames: const ['Overview', 'Exercises', 'Muscles', 'Sessions'],
        pages: [
          OverviewPage(),
          ExerciseListPage(),
          MusclesPage(),
          SessionPage()
        ],
      ),
    );
  }
}
