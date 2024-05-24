import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/workout.bloc.dart';
import '../../bloc/event/workout.event.dart';
import '../../bloc/state/workout.state.dart';
import '../widgets/WorkoutCard.dart';
import 'add.workout.page.dart';


class WorkoutPage extends StatefulWidget {
  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Workouts'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Workouts',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddWorkoutPage()),
                    ).then((_) {
                      context.read<WorkoutBloc>().add(LoadWorkouts());
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<WorkoutBloc, WorkoutState>(
              builder: (context, state) {
                if (state is WorkoutsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WorkoutsLoaded) {
                  final workouts = state.workouts;
                  if (workouts.isEmpty) {
                    return const Center(child: Text('No workout found'));
                  } else {
                    return ListView.builder(
                      itemCount: workouts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return WorkoutCard(
                          name: workouts[index].name,
                          numberOfExercises: 3,
                          muscleColors: const [Colors.red, Colors.blue, Colors.green],
                          exercises7Days: 20,
                          exercises30Days: 100,
                          caloriesBurned7Days: 500,
                        );
                      },
                    );
                  }
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
