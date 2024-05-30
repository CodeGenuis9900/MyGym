import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygym/src/data/models/Set.workout.dart';
import 'package:mygym/src/data/repositories/database.dart';
import 'package:mygym/src/presentation/widgets/custom.button.dart';
import 'package:mygym/src/bloc/set.bloc.dart';
import 'package:mygym/src/bloc/state/set.state.dart';
import 'package:mygym/src/bloc/event/set.event.dart';

class SetPage extends StatefulWidget {
  final int exerciseId;

  const SetPage({Key? key, required this.exerciseId}) : super(key: key);

  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  @override
  void initState() {
    super.initState();
    // Load sets when the page is initialized
    context.read<SetBloc>().add(LoadSetByExerciseId(widget.exerciseId));
  }

  void _addNewSet() {
    context.read<SetBloc>().add(AddSet(widget.exerciseId, 20, 20, sets.length + 1, 'Exercise'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Sets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<SetBloc, SetState>(
                builder: (context, state) {
                  if (state is SetsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SetsLoaded) {
                    final sets = state.sessions;
                    if (sets.isEmpty) {
                      return const Center(child: Text('No sets found'));
                    } else {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 3,
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
                              return Center(child: Text("${set.weight}kg"));
                            case 3:
                              return Center(child: Text(set.type));
                          }
                          return Container();
                        },
                      );
                    }
                  } else {
                    return const Center(child: Text('Something went wrong'));
                  }
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
