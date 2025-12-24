import 'package:dream_tickets/features/presentation/widgets/boutton.dart';
import 'package:dream_tickets/features/presentation/widgets/cercleProfile.dart';
import 'package:dream_tickets/features/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
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
                const SizedBox(height: 1),
                Text(
                  "Profile",
                  style: GoogleFonts.nobile(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                ProfileImagePicker(onTap: () => {}),
                SizedBox(height: 30),
                MyTextField(hintText: 'email', icon: Icons.email_outlined),
                SizedBox(height: 30),
                MyTextField(hintText: 'nom', icon: Icons.person),
                SizedBox(height: 30),
                MyTextField(hintText: 'adresse', icon: Icons.location_on),
                SizedBox(height: 30),
                PrimaryButton(text: 'ENREGISTREZ', onPressed: () => {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
