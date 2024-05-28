import 'package:flutter/material.dart';
import 'package:mygym/src/data/models/Set.workout.dart';
import 'package:mygym/src/data/repositories/database.dart';
import 'package:mygym/src/presentation/widgets/custom.button.dart';

class SetPage extends StatefulWidget {
  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  List<SetWorkoutData> sets = [
    SetWorkoutData(id: 1, points: 20, weight: 20, type: "w", setNumber: 1),
    SetWorkoutData(id: 2, points: 20, weight: 20, type: "w", setNumber: 2),
    SetWorkoutData(id: 3, points: 20, weight: 20, type: "w", setNumber: 3)


  ];

  void _addNewSet() {
    setState(() {
      int nextSetNumber = sets.length + 1;
      sets.add( SetWorkoutData(id: 3, points: 20, weight: 20, type: "w", setNumber: nextSetNumber));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Sets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Four columns
                  childAspectRatio: 3, // Adjust height/width ratio as needed
                ),
                itemCount: sets.length * 4 + 4, // +4 for header row
                itemBuilder: (context, index) {
                  if (index < 4) {
                    // Headers
                    switch (index) {
                      case 0:
                        return Center(child: Text('Set', style: TextStyle(fontWeight: FontWeight.bold)));
                      case 1:
                        return Center(child: Text('Rep', style: TextStyle(fontWeight: FontWeight.bold)));
                      case 2:
                        return Center(child: Text('Weight', style: TextStyle(fontWeight: FontWeight.bold)));
                      case 3:
                        return Center(child: Text('Type', style: TextStyle(fontWeight: FontWeight.bold)));
                    }
                  }
                  // Data
                  int dataIndex = (index - 4) ~/ 4;
                  int columnIndex = (index - 4) % 4;
                  SetWorkoutData set = sets[dataIndex];
                  switch (columnIndex) {
                    case 0:
                      return Center(child: Text(set.setNumber.toString()));
                    case 1:
                      return Center(child: Text(set.points.toString()));
                    case 2:
                      return Center(child: Text(set.weight.toString()+"kg"));
                    case 3:
                      return Center(child: Text(set.type));
                  }
                  return Container();
                },
              ),
            ),
            CustomButton(
              onPressed: _addNewSet,
              text: 'New Set',

            ),
          ],
        ),
      ),
    );
  }
}
