import 'package:dream_tickets/features/presentation/couleurs/couleurs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFieldRectangle extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final bool enabled;
  final IconData icon;
  TextEditingController? controller;
  final bool isPassword;

  MyTextFieldRectangle({
    super.key,
    this.hintText = "",
    required this.controller,
    this.obscureText = false,
    this.enabled = true,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color(0xFF6552D9)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
        filled: true,

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: couleurBleu),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(color: Colors.black, fontSize: 15),
      ),
    );
  }
}
