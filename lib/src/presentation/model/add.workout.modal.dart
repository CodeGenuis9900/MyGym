import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygym/src/presentation/widgets/rounded.input.dart';

import '../../bloc/event/workout.event.dart';
import '../../bloc/workout.bloc.dart';
import '../widgets/custom.button.dart';


class AddWorkoutModal extends StatefulWidget {
  const AddWorkoutModal({super.key});

  @override
  _AddWorkoutModalState createState() => _AddWorkoutModalState();
}

class _AddWorkoutModalState extends State<AddWorkoutModal> {
  late TextEditingController nameController;

  @override
  void initState() {
    nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Workout',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 16.0),
                CustomInputField(
                controller: nameController,
                labelText: 'Workout Name',
                leftIcon: Icons.accessibility_sharp,

              ),
              /*TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Workout Name'),
              ),*/
              const SizedBox(height: 16.0),
              CustomButton(
                onPressed: () {
                  context.read<WorkoutBloc>().add(AddWorkout(nameController.text));
                  Navigator.pop(context);
                },
                text: 'Save',
                outlined: false,// Custom border radius
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
