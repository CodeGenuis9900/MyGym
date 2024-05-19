import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as dr;


import 'package:mygym/src/data/models/Workout.dart';
import 'package:provider/provider.dart';

import '../../data/repositories/database.dart';

class AddWorkoutPage extends StatefulWidget {
  const AddWorkoutPage({super.key});

  @override
  _AddWorkoutPageState createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  late TextEditingController nameController ;
  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController();
    super.initState();
  }
  late AppDatabase appDatabase;

  @override
  Widget build(BuildContext context) {
    appDatabase = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Workout'),
        actions:  <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () => _saveWorkout(),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue, // Button color
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
              ))

        ],
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
          ],
        ),
      ),
    );
  }

  Future<int>? _saveWorkout() {
     return appDatabase.addWorkout(
        WorkoutCompanion(
         name: dr.Value(nameController.text)
      )
     );
   }
}
