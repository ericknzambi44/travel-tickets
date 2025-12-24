import 'package:flutter/material.dart';

class PaiemenPage extends StatefulWidget {
  const PaiemenPage({super.key});

  @override
  State<PaiemenPage> createState() => _PaiementState();
}

class _PaiementState extends State<PaiemenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF25E7A), Color(0xFF44388C)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
