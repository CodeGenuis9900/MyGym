import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String exerciseItem;
  final VoidCallback onTap;
  const ExerciseCard({
    super.key,
    required this.exerciseItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exerciseItem,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                ],
              )),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}
