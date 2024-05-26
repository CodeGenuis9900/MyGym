import 'package:flutter/material.dart';
import 'package:mygym/src/utils/app.colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool outlined;
  final Color color;
  final double borderRadius;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.outlined = false,
    this.color = AppColors.blueV0,
    this.borderRadius = 8.0,
    this.textColor = Colors.white, // Default text color
  });

  @override
  Widget build(BuildContext context) {
    return outlined
        ? OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(textColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      child: Text(text),
    )
        : ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(textColor),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}
