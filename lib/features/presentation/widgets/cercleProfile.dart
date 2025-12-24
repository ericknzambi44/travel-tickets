import 'dart:io';
import 'package:flutter/material.dart';

class ProfileImagePicker extends StatelessWidget {
  final File? imageFile;
  final String? imageUrl;
  final VoidCallback onTap;
  final double radius;

  const ProfileImagePicker({
    super.key,
    this.imageFile,
    this.imageUrl,
    required this.onTap,
    this.radius = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: radius - 2, // Petit contour blanc
          backgroundColor: Colors.grey[200],
          backgroundImage: _getImage(),
          child: _getIcon(),
        ),
      ),
    );
  }

  // Logique pour déterminer l'image à afficher
  ImageProvider? _getImage() {
    if (imageFile != null) {
      return FileImage(imageFile!);
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      return NetworkImage(imageUrl!);
    }
    return null;
  }

  // Affiche l'icône si aucune image n'est présente
  Widget? _getIcon() {
    if (imageFile == null && (imageUrl == null || imageUrl!.isEmpty)) {
      return Icon(
        Icons.person,
        size: radius,
        color: Color(0xFFF25E7A), // Couleur proche de ton design
      );
    }
    return null;
  }
}
