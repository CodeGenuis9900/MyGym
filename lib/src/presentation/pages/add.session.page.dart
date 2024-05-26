import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../bloc/event/session.event.dart';
import '../../utils/app.colors.dart';
import '../../bloc/session.bloc.dart';
import '../widgets/custom.button.dart';

class AddSessionPage extends StatefulWidget {
  final int workoutId;

  const AddSessionPage({super.key, required this.workoutId});

  @override
  _AddSessionPageState createState() => _AddSessionPageState();
}

class _AddSessionPageState extends State<AddSessionPage> {
  late DateTime _selectedDay;
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _startTime = TimeOfDay.now();
    _endTime = TimeOfDay.now();
  }

  DateTime _combineDateWithTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {
            final startDateTime = _combineDateWithTime(_selectedDay, _startTime);
            final endDateTime = _combineDateWithTime(_selectedDay, _endTime);
            context.read<SessionBloc>().add(
              AddSession(
                widget.workoutId,
                startDateTime,
                endDateTime,
              ),
            );
            Navigator.pop(context); // Return to the previous screen
          },
          text: "Save",
          outlined: false,
        ),
      ),
    );
  }
}
