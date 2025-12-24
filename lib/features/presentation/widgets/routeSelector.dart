import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteselectorWidget extends StatelessWidget {
  final String departureCity;
  final String arrivalCity;
  final VoidCallback? oneDepartureTap;
  final VoidCallback? oneArrrivalTap;
  const RouteselectorWidget({
    super.key,
    required this.departureCity,
    required this.arrivalCity,
    this.oneDepartureTap,
    this.oneArrrivalTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color safariPurple = Color(0xFF44388C);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCityBox(departureCity, safariPurple, oneDepartureTap),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.directions_bus, color: safariPurple, size: 28),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,

                  (index) => Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: safariPurple,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildCityBox(arrivalCity, safariPurple, oneArrrivalTap),
      ],
    );
  }
}

//sous widget pour prive pour les boites Bunia/Aru
Widget _buildCityBox(String name, Color color, VoidCallback? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 5),
          Icon(Icons.arrow_drop_down, color: color),
        ],
      ),
    ),
  );
}
