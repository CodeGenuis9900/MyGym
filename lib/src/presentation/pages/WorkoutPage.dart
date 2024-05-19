import 'package:flutter/material.dart';
import 'package:mygym/src/data/models/Workout.dart';
import 'package:mygym/src/data/repositories/database.dart';
import 'package:provider/provider.dart';

import '../widgets/WorkoutCard.dart';
import 'AddWorkoutPage.dart';

class WorkoutPage extends StatefulWidget {

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  get controller => null;

  get onChanged => null;
  late AppDatabase appDatabase;
  @override
  Widget build(BuildContext context) {
    appDatabase = Provider.of<AppDatabase>(context);
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
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          )
          ,
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
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<WorkoutData>>(
              builder: (context,snapshot) {
                if(snapshot.hasData){
                  List<WorkoutData>? workoutList= snapshot.data;
                  if(workoutList !=null ){
                    if(workoutList.isEmpty){
                      return const Center(
                        child: Text(
                          'No workout found',
                        ),
                      );
                    }
                    else{
                      return workoutListUI(workoutList);
                    }
                  }

                }
                else if(snapshot.hasError){
                  return const Center(
                    child: Text(
                        'Somethings goes wrong'
                    ),
                  );
                }
                return Center(
                  child: Text(
                    'Click on add button to add new workout',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                );
              }, future: _getWorkoutData(),
            )


          ),
        ],
      ));
  }
  Future<List<WorkoutData>>? _getWorkoutData() {
    return appDatabase.allWorkouts;
  }

  Widget workoutListUI(List<WorkoutData> workoutList) {
    return ListView.builder(
      itemCount: workoutList.length, // Replace with actual number of workouts
      itemBuilder: (BuildContext context, int index) {
        return WorkoutCard(
          name: workoutList[index].name,
          numberOfExercises: 3,
          muscleColors: const [Colors.red, Colors.blue, Colors.green],
          // Example colors for muscles
          exercises7Days: 20,
          exercises30Days: 100,
          caloriesBurned7Days: 500,
        );
      },
    );
  }
}

