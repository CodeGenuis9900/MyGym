import 'package:flutter/material.dart';

class WorkoutDetailsPage extends StatelessWidget {
  const WorkoutDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Details'),
      ),
      body: const Center(
        child: Text(
          'Details of the workout go here',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
