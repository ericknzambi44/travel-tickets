import 'package:dream_tickets/features/presentation/widgets/BoutonPaiement.dart';
import 'package:dream_tickets/features/presentation/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 90),

                  child: Center(
                    child: Text(
                      "SAFARI",
                      style: GoogleFonts.monoton(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),

                    child: Container(
                      padding: EdgeInsets.all(30),

                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "Mode de paiement",
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Numero",
                                style: TextStyle(color: Color(0xFF6552D9)),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "081 00 00 000",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF6552D9),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Text("Montat facture:"),
                                const SizedBox(width: 10),
                                Text(
                                  "20 \$",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 90),

                            BoutonPaiement(
                              onPressed: () {
                                Navigator.pushNamed(context, "/ticket");
                                // logique succes
                                //  _effectuerPaiement();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
