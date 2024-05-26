import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygym/src/presentation/pages/add.session.page.dart';
import 'package:mygym/src/presentation/widgets/custom.button.dart';
import 'package:mygym/src/utils/app.colors.dart';

import '../../bloc/session.bloc.dart';
import '../../bloc/state/session.state.dart';
import '../card/session.card.dart';

class SessionPage extends StatelessWidget {
  final int workoutId;

  // Constructor should take workoutId as a required parameter
  const SessionPage({super.key, required this.workoutId});

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
                  return SessionCard(
                    leftIcon: Icons.timelapse_outlined,
                    onTap: () {
                      // Handle session card tap
                    },
                    title: sessions[index].startTime.toString(), // Corrected data display
                    subtitle: sessions[index].endTime.toString(), // Corrected data display
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
        padding: const EdgeInsets.only(bottom: 30.0, right: 20.0, left: 20.0),
        child: CustomButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddSessionPage(workoutId: workoutId),
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
