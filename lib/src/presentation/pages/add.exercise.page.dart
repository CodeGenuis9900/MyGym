import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygym/src/bloc/exercise.item.bloc.dart';
import 'package:mygym/src/bloc/event/exercise.item.event.dart';
import 'package:mygym/src/bloc/state/exercise.item.state.dart';
import 'package:mygym/src/bloc/event/exercise.event.dart';
import 'package:mygym/src/bloc/exercise.bloc.dart';
import 'package:mygym/src/bloc/state/workout.shared.id.state.dart';
import 'package:mygym/src/data/repositories/database.dart';
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
  int? _selectedExerciseId;

  @override
  Widget build(BuildContext context) {
    context.read<ExerciseItemBloc>().add(LoadExerciseItems());
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
              BlocBuilder<ExerciseItemBloc, ExerciseItemState>(
                builder: (context, state) {
                  if (state is ExerciseItemLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ExerciseItemLoaded) {
                    return DropdownButtonFormField<ExerciseItemData>(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      items: state.exerciseItems.map((ExerciseItemData value) {
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
                    );
                  } else {
                    return const Text('Failed to load exercises');
                  }
                },
              ),
              if (_selectedExerciseId != null)
                Text('Selected Exercise ID: $_selectedExerciseId'),
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
