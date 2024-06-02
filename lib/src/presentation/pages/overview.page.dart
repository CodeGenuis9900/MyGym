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
      SummaryData(icon: Icons.fitness_center, title: 'Muscles Hit', value: '10'),
      SummaryData(icon: Icons.timer, title: 'Minutes Spent', value: '120'),
      // Add more summaries as needed
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Summary',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    // Handle the menu selection here
                    print(value);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'This Week',
                        child: Text('This Week'),
                      ),
                      PopupMenuItem<String>(
                        value: 'This Month',
                        child: Text('This Month'),
                      ),
                      PopupMenuItem<String>(
                        value: 'This 2 Weeks',
                        child: Text('This 2 Weeks'),
                      ),
                    ];
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Three columns
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
          ],
        ),
      ),
    );
  }
}
