import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../bloc/event/session.event.dart';
import '../../bloc/state/workout.shared.id.state.dart';
import '../../bloc/workout.shared.id.bloc.dart';
import '../../utils/app.colors.dart';
import '../../bloc/session.bloc.dart';
import '../widgets/custom.button.dart';
import '../widgets/rounded.input.dart';
import '../widgets/toast.widget.dart';

class AddSessionPage extends StatefulWidget {
  const AddSessionPage({super.key});

  @override
  _AddSessionPageState createState() => _AddSessionPageState();
}

class _AddSessionPageState extends State<AddSessionPage> {
  late DateTime _selectedDay;
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;
  late String _sessionName;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _startTime = TimeOfDay.now();
    _endTime = TimeOfDay.now();

    // Initialize session name
    final workoutId = (context.read<WorkoutIdBloc>().state as WorkoutIdSelected).workoutId;
    _sessionName = 'Session'; // Default session name
  }

  DateTime _combineDateWithTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value.length < 3) {
      return 'Minimum 3 characters required';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    final workoutId = (context.read<WorkoutIdBloc>().state as WorkoutIdSelected).workoutId;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Session'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Session Name :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomInputField(
                controller: TextEditingController(text: _sessionName),
                labelText: 'Enter session name',
                leftIcon: Icons.fitness_center,
                onChanged:(value) {
                  setState(() {
                    _sessionName = value;
                  });
                },
                validator:_validateInput
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Choose your time :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _selectedDay,
              calendarFormat: CalendarFormat.month,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
            ),
            ListTile(
              title: const Text('Start Time :'),
              trailing: TextButton(
                onPressed: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: _startTime,
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _startTime = pickedTime;
                    });
                  }
                },
                child: Text(
                  _startTime.format(context),
                ),
              ),
            ),
            ListTile(
              title: const Text('End Time :'),
              trailing: TextButton(
                onPressed: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: _endTime,
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _endTime = pickedTime;
                    });
                  }
                },
                child: Text(
                  _endTime.format(context),
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30.0, right: 20.0, left: 20.0),
        child: CustomButton(
          onPressed: () async {
            final startDateTime =
            _combineDateWithTime(_selectedDay, _startTime);
            final endDateTime = _combineDateWithTime(_selectedDay, _endTime);
            try {
              context.read<SessionBloc>().add(
                AddSession(
                  workoutId,
                  startDateTime,
                  endDateTime,
                  _sessionName // Pass the session name
                ),
              );

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
          text: "Save",
          outlined: false,
        ),
      ),
    );
  }
}
