import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData leftIcon;
  final double borderRadius;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.leftIcon,
    this.borderRadius= 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Icon(leftIcon),
            const SizedBox(width: 10.0),
            Expanded(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: labelText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
