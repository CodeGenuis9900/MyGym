import 'package:flutter/material.dart';

import '../../data/models/MuscleData.dart';
import '../widgets/custom.progress.bar.dart';

class MusclesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<MuscleData> mostInvolvedMuscles = [
      MuscleData(name: 'Biceps', involvement: 0.8, status: 'Tired'),
      MuscleData(name: 'Quadriceps', involvement: 0.75, status: 'Tired'),
      MuscleData(name: 'Triceps', involvement: 0.7, status: 'Tired'),
    ];

    final List<MuscleData> otherMuscles = [
      MuscleData(name: 'Hamstrings', involvement: 0.4, status: 'Rested'),
      MuscleData(name: 'Calves', involvement: 0.5, status: 'Rested'),
      MuscleData(name: 'Deltoids', involvement: 0.3, status: 'Tired'),
      // Add more muscles as needed
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Most Involved',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              ...mostInvolvedMuscles.map((muscle) => MuscleProgressBar(
                text: muscle.name,
                progress: muscle.involvement,
              )),
              const SizedBox(height: 24.0),
              const Text(
                'Other Included',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: otherMuscles.length,
                itemBuilder: (context, index) {
                  final muscle = otherMuscles[index];
                  return ListTile(
                    title: Text(muscle.name),
                    trailing: Text(
                      muscle.status,
                      style: TextStyle(
                        color: muscle.status == 'Tired' ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
