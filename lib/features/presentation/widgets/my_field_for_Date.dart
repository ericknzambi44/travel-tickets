import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyFieldForDate extends StatelessWidget {
  final DateTime selectorDate;
  final VoidCallback onTap;
  final IconData icon;

  const MyFieldForDate({
    super.key,
    required this.onTap,
    required this.selectorDate,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    const purpleColor = Color(0xFF44388C);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        readOnly: true,
        onTap: onTap,

        decoration: InputDecoration(
          hintText: DateFormat('dd/MM/yyyy').format(selectorDate),
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
