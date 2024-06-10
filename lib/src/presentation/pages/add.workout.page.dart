import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/workout.bloc.dart';
import '../../bloc/event/workout.event.dart';
import '../widgets/toast.widget.dart';

class AddWorkoutPage extends StatefulWidget {
  const AddWorkoutPage({super.key});

  @override
  _AddWorkoutPageState createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  late TextEditingController nameController;

  @override
  void initState() {
    nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Workout'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                try {
                  context
                      .read<WorkoutBloc>()
                      .add(AddWorkout(nameController.text));
                  ToastManager.show(
                    context,
                    title: 'Success',
                    description: 'Operation completed successfully',
                    status: ToastStatus.success,
                  );

                  Navigator.pop(context);
                } catch (_) {
                  ToastManager.show(
                    context,
                    title: 'Error',
                    description: 'An error occurred',
                    status: ToastStatus.error,
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
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
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'Workout Name', border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
