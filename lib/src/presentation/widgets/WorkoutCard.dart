import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String name;
  final int numberOfExercises;
  final List<Color> muscleColors; // List of colors representing muscles
  final int exercises7Days;
  final int exercises30Days;
  final int caloriesBurned7Days;

  WorkoutCard({
    required this.name,
    required this.numberOfExercises,
    required this.muscleColors,
    required this.exercises7Days,
    required this.exercises30Days,
    required this.caloriesBurned7Days,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Number of Exercises: $numberOfExercises',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: _buildLittleCard(
                    '7 Days',
                    '$exercises7Days',
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: _buildLittleCard(
                    '30 Days',
                    '$exercises30Days',
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: _buildLittleCard(
                    '30 Days',
                    '$exercises30Days',
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: _buildLittleCard(
                    '30 Days',
                    '$exercises30Days',
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: List.generate(
                muscleColors.length,
                    (index) => Container(
                  width: 30,
                  height: 8,
                  margin: EdgeInsets.only(right: 8.0),
                  color: muscleColors[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLittleCard(String title, String content) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            Text(content),
          ],
        ),
      ),
    );
  }
}
