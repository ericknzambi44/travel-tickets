import 'package:dream_tickets/features/presentation/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return Scaffold(
      // On utilise ta navigation existante ici
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Stack(
        children: [
          // 1. Fond dégradé (Comme sur tes photos précédentes)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF25E7A), Color(0xFF44388C)],
              ),
            ),
          ),

          // 2. Contenu de la page
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "SAFARI",
                  style: GoogleFonts.monoton(
                    fontSize: 40,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 30),

                // 3. Le Ticket Blanc
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        _buildHeaderSection(),
                        _buildDashedLine(), // Ligne pointillée
                        _buildDetailsSection(),
                        _buildDashedLine(), // Ligne pointillée
                        _buildQRCodeSection(), // Zone QR Code
                      ],
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

  // Section Départ / Arrivée
  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _locationColumn("BUNIA", "Départ"),
          _locationColumn("BUNIA", "Arrivée"),
        ],
      ),
    );
  }

  Widget _locationColumn(String city, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          city,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6C63FF),
          ),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  // Section des détails du passager
  Widget _buildDetailsSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow("Ticket N°", "0001"),
          _infoRow("Passager", "JEAN PAUL MMMM"),
          _infoRow("Heure de départ", "10 h 00"),
          _infoRow("Total payé", "20 \$", isBold: true),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "EN COURS",
              style: TextStyle(
                color: Color(0xFF6C63FF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: isBold ? const Color(0xFF6C63FF) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Zone QR Code (Vide pour l'instant)
  Widget _buildQRCodeSection() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.qr_code_2,
            size: 100,
            color: Color(0xFF6C63FF),
          ),
          // Plus tard, tu remplaceras l'Icon par ton widget QrImageView
        ),
      ),
    );
  }

  // Widget pour dessiner une ligne pointillée
  Widget _buildDashedLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: List.generate(
          30,
          (index) => Expanded(
            child: Container(
              color: index % 2 == 0 ? Colors.transparent : Colors.grey.shade400,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
