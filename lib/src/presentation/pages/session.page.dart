import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/session.bloc.dart';
import '../../bloc/state/session.state.dart';

class SessionPage extends StatelessWidget {

  const SessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
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
                    return const Text("");
                  },
                );
              }
            } else {
              return const Center(child: Text('Something went wrong'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement logic to navigate to add session page
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
