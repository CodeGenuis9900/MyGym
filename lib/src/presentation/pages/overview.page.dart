import 'package:flutter/material.dart';
import '../../data/models/SummaryData.dart';
import '../card/summary.card.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<SummaryData> summaries = [
      SummaryData(icon: Icons.local_fire_department, title: 'Kcal Burned', value: '16 kcal'),
      SummaryData(icon: Icons.fitness_center, title: 'Kg Lifted', value: '650 kg'),
      SummaryData(icon: Icons.access_time, title: 'Times Trained', value: '12'),
      SummaryData(icon: Icons.directions_run, title: 'Workouts', value: '5'),
      // Add more summaries as needed
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust the number of columns
            childAspectRatio: 1, // Make the cards square
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: summaries.length,
          itemBuilder: (context, index) {
            final summary = summaries[index];
            return SummaryCard(
              icon: summary.icon,
              title: summary.title,
              value: summary.value,
            );
          },
        ),
      ),
    );
  }
}
