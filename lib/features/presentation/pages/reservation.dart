import 'package:dream_tickets/features/presentation/widgets/boutton.dart';
import 'package:dream_tickets/features/presentation/widgets/bouttonCercle.dart';
import 'package:dream_tickets/features/presentation/widgets/inputfieldRectangle.dart';
import 'package:dream_tickets/features/presentation/widgets/my_field_for_Date.dart';
import 'package:dream_tickets/features/presentation/widgets/navbar.dart';
import 'package:dream_tickets/features/presentation/widgets/routeSelector.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dream_tickets/features/presentation/widgets/helpersMenuProfile.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReserverState();
}

class _ReserverState extends State<ReservationPage> {
  int _selectedIndex = 0;
  DateTime? _dateSelector;
  Future<void> _ouvrirCalendrier() async {
    final DateTime? result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (result != null) {
      setState(() {
        _dateSelector = result;
      });
    }
  }

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
          Positioned(
            top: 40,
            left: 20,
            child: ProfileButton(onTap: () => {showProfileMenu(context)}),
          ),

          SafeArea(
            child: Column(
              children: [
                Container(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 90),

                  child: Center(
                    child: Text(
                      "SAFARI",
                      style: GoogleFonts.monoton(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 5,
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
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Text(
                            " Reservation",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 30),
                          //bunia
                          RouteselectorWidget(
                            departureCity: "BUNIA",
                            arrivalCity: "ARU",
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text("Depart"),
                              SizedBox(width: 242),
                              Text("Arrivee"),
                            ],
                          ),
                          const SizedBox(height: 10),

                          MyFieldForDate(
                            onTap: _ouvrirCalendrier,
                            selectorDate: _dateSelector ?? DateTime.now(),
                            icon: Icons.calendar_view_day_rounded,
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("Heure depart"),
                                  const SizedBox(width: 32),
                                  Text("10"),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text("Montat a payer"),
                                  const SizedBox(width: 20),
                                  Text("10"),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          MonInputRectangleField(
                            hintText: "Nom du passager",
                            icon: Icons.person,
                            readonly: true,
                          ),
                          const SizedBox(height: 40),
                          PrimaryButton(text: "RESERVEZ", onPressed: () => {}),
                          const SizedBox(height: 75),
                          CustomBottomNavBar(
                            currentIndex: _selectedIndex,
                            onTap: (index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                          ),
                        ],
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
