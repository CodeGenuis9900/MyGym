import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygym/src/presentation/pages/add.session.page.dart';
import 'package:mygym/src/presentation/widgets/custom.button.dart';
import 'package:mygym/src/utils/app.colors.dart';

import '../../bloc/event/session.event.dart';
import '../../bloc/session.bloc.dart';
import '../../bloc/state/session.state.dart';
import '../../bloc/state/workout.shared.id.state.dart';
import '../../bloc/workout.shared.id.bloc.dart';
import '../../data/repositories/database.dart';
import '../card/session.card.dart';

class SessionPage extends StatefulWidget {

  // Constructor should take workoutId as a required parameter
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  Widget build(BuildContext context) {
    final workoutId = (context.read<WorkoutIdBloc>().state as WorkoutIdSelected).workoutId;
    return Scaffold(
      body: BlocProvider(
        create: (context) => SessionBloc(context.read<AppDatabase>())
          ..add(LoadSessionByWorkoutId(workoutId)),
        child: BlocBuilder<SessionBloc, SessionState>(
          builder: (context, state) {
            if (state is SessionsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SessionsLoaded) {
              final sessions = state.sessions;
              if (sessions.isEmpty) {
                return const Center(child: Text('No session found'));
              } else {
                return ListView.builder(
                  itemCount: sessions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SessionCard(
                      leftIcon: Icons.timelapse_outlined,
                      onTap: () {
                        // Handle session card tap
                      },
                      title: sessions[index]
                          .startTime
                          .toString(), // Corrected data display
                      subtitle: sessions[index]
                          .endTime
                          .toString(), // Corrected data display
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: 30.0, right: 20.0, left: 20.0, top: 10),
        child: CustomButton(
          onPressed: () async {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddSessionPage(),
              ),
            );
          },
          text: "New Session",
          outlined: false,
          color: AppColors.blueV0,
        ),
      ),
    );
  }
}
