import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MonInputRectangleField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool readonly;
  final VoidCallback? onTap;

  const MonInputRectangleField({
    super.key,
    required this.hintText,
    required this.icon,
    this.readonly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const purpleColor = Color(0xFF44388C);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        readOnly: readonly,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: purpleColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: purpleColor.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: purpleColor, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
