import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygym/src/bloc/event/exercise.event.dart';
import 'package:mygym/src/bloc/exercise.bloc.dart';
import 'package:mygym/src/data/repositories/database.dart';

import '../../bloc/state/workout.shared.id.state.dart';
import '../../bloc/workout.shared.id.bloc.dart';
import '../widgets/toast.widget.dart';

class AddExercisePage extends StatefulWidget {
  const AddExercisePage({super.key});

  @override
  _AddExercisePageState createState() => _AddExercisePageState();
}

class _AddExercisePageState extends State<AddExercisePage> {
  final _formKey = GlobalKey<FormState>();
  int? _points;
  int? _repetitions;
  ExerciseItemData? exerciseItemData;
  int? exerciseItemId;
  int? _selectedExerciseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Exercise'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: _saveForm,
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
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
              DropdownButtonFormField<ExerciseItemData>(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                items: <ExerciseItemData>[
                  const ExerciseItemData(id: 1, label: 'Exercise 1'),
                  const ExerciseItemData(id: 2, label: 'Exercise 2'),
                  const ExerciseItemData(id: 3, label: 'Exercise 3')
                ].map((ExerciseItemData value) {
                  return DropdownMenuItem<ExerciseItemData>(
                    value: value,
                    child: Text(value.label),
                  );
                }).toList(),
                onChanged: (ExerciseItemData? newValue) {
                  setState(() {
                    _selectedExerciseId = newValue?.id;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a title' : null,
              ),
              if (_selectedExerciseId != null)
                Text('Selected Exercise ID: $_selectedExerciseId'),
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
    print(
        'Selected Exercise ID: $_selectedExerciseId, Points: $_points, Repetitions: $_repetitions');
    try {
      final workoutId =
          (context.read<WorkoutIdBloc>().state as WorkoutIdSelected).workoutId;
      context
          .read<ExerciseBloc>()
          .add(AddExercise(workoutId, _selectedExerciseId ?? 0));
      ToastManager.show(
        context,
        title: 'Success',
        description: 'Exercise added successfully',
        status: ToastStatus.success,
      );
    } catch (_) {
      ToastManager.show(
        context,
        title: 'Error',
        description: 'An error occurred',
        status: ToastStatus.error,
      );
    }
  }
}
