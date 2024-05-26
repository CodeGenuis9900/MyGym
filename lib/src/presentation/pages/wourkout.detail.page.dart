import 'package:flutter/material.dart';

import '../widgets/tab.bar.with.pages.widget.dart';

class WorkoutDetailPage extends StatefulWidget {
  final String workoutName;

  const WorkoutDetailPage({super.key, required this.workoutName});

  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workoutName),
      ),
      body: TabBarWithPages(
        tabNames: const ['Overview', 'Exercises', 'Muscles', 'Sessions'],
        pages: const [
          Center(child: Text('Overview')),
          Center(child: Text('Exercises')),
          Center(child: Text('Muscles')),
          Center(child: Text('Sessions')),
        ],
      ),
    );
  }
}
