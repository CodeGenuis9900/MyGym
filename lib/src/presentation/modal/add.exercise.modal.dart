import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/event/exercise.event.dart';
import '../../bloc/exercise.bloc.dart';
import '../../bloc/exercise.item.bloc.dart';
import '../../bloc/state/exercise.item.state.dart';
import '../../bloc/state/workout.shared.id.state.dart';
import '../../bloc/workout.shared.id.bloc.dart';
import '../../data/repositories/database.dart';
import '../widgets/custom.button.dart';
import '../widgets/toast.widget.dart';

class AddExerciseModal extends StatefulWidget {
  const AddExerciseModal({super.key});

  @override
  State<StatefulWidget> createState() => _AddExerciseModalState();
}

class _AddExerciseModalState extends State<AddExerciseModal> {
  final _formKey = GlobalKey<FormState>();
  int? _selectedExerciseId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Exercise',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
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
                          items:
                              state.exerciseItems.map((ExerciseItemData value) {
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
                  const SizedBox(height: 16.0),
                  CustomButton(
                    onPressed: _saveForm,
                    text: 'Save',
                    outlined: false, // Custom border radius
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
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
    print('Selected Exercise ID: $_selectedExerciseId');
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
