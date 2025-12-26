import 'package:flutter/material.dart';

class BoutonPaiement extends StatefulWidget {
  final VoidCallback onPressed;
  final String texte;

  const BoutonPaiement({
    super.key,
    required this.onPressed,
    this.texte = "Confirmer le paiement",
  });

  @override
  State<BoutonPaiement> createState() => _BoutonPaiementState();
}

class _BoutonPaiementState extends State<BoutonPaiement> {
  bool _isLoading = false;

  void _handlePress() async {
    setState(() => _isLoading = true);

    // On simule un délai de traitement de 2 secondes
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isLoading = false);
      widget.onPressed(); // Appelle la fonction de succès
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handlePress,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF44388C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 2,
        ),
        child: _isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                widget.texte,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
