import 'package:flutter/material.dart';

class AddWorkoutPage extends StatefulWidget {
  @override
  _AddWorkoutPageState createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberOfExercisesController = TextEditingController();
  TextEditingController muscleController = TextEditingController();
  TextEditingController exercises7DaysController = TextEditingController();
  TextEditingController exercises30DaysController = TextEditingController();
  TextEditingController caloriesBurned7DaysController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Workout Name'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: numberOfExercisesController,
              decoration: const InputDecoration(labelText: 'Number of Exercises'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: muscleController,
              decoration: const InputDecoration(labelText: 'Muscles Worked'),
            ),
            const SizedBox(height: 16.0),
            const Text('Workout Advancement'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: exercises7DaysController,
                    decoration: const InputDecoration(labelText: 'Exercises (7 Days)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    controller: exercises30DaysController,
                    decoration: const InputDecoration(labelText: 'Exercises (30 Days)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: caloriesBurned7DaysController,
              decoration: const InputDecoration(labelText: 'Calories Burned (7 Days)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add functionality to save the workout
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
