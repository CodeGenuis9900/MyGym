import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygym/src/presentation/pages/add.session.page.dart';
import 'package:mygym/src/presentation/pages/session.detail.page.dart';
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
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  void initState() {
    super.initState();
    final workoutId = (context.read<WorkoutIdBloc>().state as WorkoutIdSelected).workoutId;
    context.read<SessionBloc>().add(LoadSessionByWorkoutId(workoutId));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<SessionBloc, SessionState>(
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
                  final session = sessions[index];
                  final duration = _calculateDuration(session.startTime, session.endTime);
                  return SessionCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SessionDetailPage()),
                      );

                    },
                    title: session.nameSession,
                    subtitle: duration,
                    imagePath: 'images/session.jpg', // Corrected data display
                  );
                },
              );
            }
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
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

  String _calculateDuration(DateTime startTime, DateTime endTime) {
    final duration = endTime.difference(startTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    if (hours > 0) {
      return '$hours h ${minutes} min';
    } else {
      return '$minutes min';
    }
  }
}
