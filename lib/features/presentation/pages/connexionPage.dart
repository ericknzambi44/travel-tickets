import 'package:dream_tickets/features/presentation/widgets/boutton.dart';
import 'package:dream_tickets/features/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _EnregistrerState();
}

class _EnregistrerState extends State<ConnexionPage> {
  void Function()? get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          constraints: BoxConstraints.expand(),

          padding: EdgeInsets.only(top: 85),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF25E7A), Color(0xFF44388C)],
            ),
          ),

          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  "SAFARI",
                  style: GoogleFonts.monoton(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 5,
                  ),
                ),
                SizedBox(height: 100),
                MyTextField(hintText: 'email', icon: Icons.email_outlined),
                SizedBox(height: 50),
                MyTextField(
                  hintText: 'mot de passe',
                  icon: Icons.password_rounded,
                  isPassword: true,
                ),
                SizedBox(height: 50),
                PrimaryButton(text: 'CONNECTEZ-VOUS', onPressed: () {}),
                SizedBox(height: 50),
                Text(
                  "Vous n'avez pas encore de compte?",
                  // style: TextStyle(color: Colors.white),
                  style: GoogleFonts.inter(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 30),
                PrimaryButton(text: 'INSCRIVEZ-VOUS', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
