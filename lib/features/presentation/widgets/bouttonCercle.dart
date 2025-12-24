import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? imageURL;
  const ProfileButton({super.key, required this.onTap, this.imageURL});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: imageURL != null
              ? ClipOval(child: Image.network(imageURL!, fit: BoxFit.cover))
              : const Icon(Icons.person, color: Color(0xFFF25E7A)),
        ),
      ),
    );
  }
}
