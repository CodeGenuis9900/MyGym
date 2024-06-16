import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData leftIcon;
  final double borderRadius;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.leftIcon,
    this.borderRadius = 8.0,
    this.onChanged,
    this.validator,
  });

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  String? errorText;

  void _handleOnChanged(String value) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
    if (widget.validator != null) {
      setState(() {
        errorText = widget.validator!(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(widget.leftIcon),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: widget.labelText,
                    ),
                    onChanged: _handleOnChanged,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              errorText!,
              style: TextStyle(color: Colors.red, fontSize: 12.0),
            ),
          ),
      ],
    );
  }
}
