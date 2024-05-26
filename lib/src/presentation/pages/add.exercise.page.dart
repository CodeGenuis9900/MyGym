import 'package:flutter/material.dart';

class AddExercisePage extends StatefulWidget {
  const AddExercisePage({super.key});

  @override
  _AddExercisePageState createState() => _AddExercisePageState();
}

class _AddExercisePageState extends State<AddExercisePage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedTitle;
  int? _points;
  int? _repetitions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Exercise'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Set the background color to blue
            ),
            onPressed: _saveForm, // Call _saveForm when pressed
            child: const Text(
              'Save',
              style:
                  TextStyle(color: Colors.white), // Set the text color to white
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                items: <String>['Exercise 1', 'Exercise 2', 'Exercise 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTitle = newValue;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a title' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Points',
                ),
                keyboardType: TextInputType.number,
                onSaved: (String? value) {
                  _points = int.tryParse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter points';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Repetitions',
                ),
                keyboardType: TextInputType.number,
                onSaved: (String? value) {
                  _repetitions = int.tryParse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter repetitions';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _saveExercise();
    }
  }

  void _saveExercise() {
    // Implement the action to be performed on form submission.
    print(
        'Title: $_selectedTitle, Points: $_points, Repetitions: $_repetitions');
  }
}
