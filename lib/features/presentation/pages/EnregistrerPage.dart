import 'package:dream_tickets/features/presentation/blocs/Auth/auth_bloc.dart';
import 'package:dream_tickets/features/presentation/blocs/Auth/auth_event.dart';
import 'package:dream_tickets/features/presentation/blocs/Auth/auth_state.dart';
import 'package:dream_tickets/features/presentation/pages/connexionPage.dart';
import 'package:dream_tickets/features/presentation/widgets/boutton.dart';
import 'package:dream_tickets/features/presentation/widgets/text_field.dart';
import 'package:dream_tickets/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class EnregistrerPage extends StatefulWidget {
  const EnregistrerPage({super.key});

  @override
  State<EnregistrerPage> createState() => _EnregistrerState();
}

class _EnregistrerState extends State<EnregistrerPage> {
  void Function()? get onPressed => null;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSucces) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ConnexionPage()),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return Container(
              child: Container(
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
                        MyTextField(
                          hintText: 'email',
                          icon: Icons.email_outlined,
                          controller: _emailController,
                        ),
                        SizedBox(height: 50),
                        MyTextField(
                          hintText: 'mot de passe',
                          icon: Icons.password_rounded,
                          isPassword: true,
                          controller: _passwordController,
                        ),
                        SizedBox(height: 50),
                        MyTextField(
                          hintText: 'Confirmez mot de passe',
                          icon: Icons.password_rounded,
                          isPassword: true,
                          controller: _confirmPasswordController,
                        ),
                        SizedBox(height: 50),
                        PrimaryButton(
                          text: 'CREEZ-COMPTE',
                          onPressed: () {
                            final email = _emailController.text.trim();
                            final password = _passwordController.text.trim();
                            final confirmpassw = _confirmPasswordController.text
                                .trim();
                            if (email.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Veuillez remplir tous le champs",
                                  ),
                                ),
                              );
                              return;
                            }
                            if (password != confirmpassw) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Les mots de passe ne correspondent pas",
                                  ),
                                ),
                              );
                              return;
                            }
                            context.read<AuthBloc>().add(
                              RegisterSubmitted(
                                email: email,
                                password: password,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 50),
                        Text(
                          "Deja inscrit?",
                          // style: TextStyle(color: Colors.white),
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 30),
                        PrimaryButton(
                          text: 'CONNECTEZ-VOUS',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConnexionPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
