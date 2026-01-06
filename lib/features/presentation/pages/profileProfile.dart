import 'package:dream_tickets/features/presentation/couleurs/couleurs.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfilePage2 extends StatefulWidget {
  const ProfilePage2({super.key});

  @override
  State<ProfilePage2> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage2> {
  final supabase = Supabase.instance.client;
  final _nomController = TextEditingController();
  final _adresseController = TextEditingController();
  final _emailController = TextEditingController();

  String? _photoUrl;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController.text = supabase.auth.currentUser?.email ?? '';
    _fetchProfileData();
  }

  @override
  void dispose() {
    _nomController.dispose();
    _adresseController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // 1. RÉCUPÉRATION DES DONNÉES DE PROFIL
  Future<void> _fetchProfileData() async {
    final User? user = supabase.auth.currentUser;
    if (user == null) return;

    setState(() => _isLoading = true);

    try {
      final data = await supabase
          .from('profils')
          .select('nom, adresse, photo_url')
          .eq('id', user.id)
          .single();

      if (mounted) {
        setState(() {
          _nomController.text = data['nom'] ?? '';
          _adresseController.text = data['adresse'] ?? '';
          _photoUrl = data['photo_url'];
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erreur: Impossible de charger le profil.'),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  // 2. MISE À JOUR DES DONNÉES DE PROFIL (Nom et Adresse)
  Future<void> _updateProfile() async {
    final User? user = supabase.auth.currentUser;
    if (user == null) return;

    setState(() => _isLoading = true);

    try {
      await supabase
          .from('profils')
          .update({
            'nom': _nomController.text,
            'adresse': _adresseController.text,
          })
          .eq('id', user.id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profil mis à jour avec succès!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erreur lors de la mise à jour.')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  // 3. LOGIQUE DE TÉLÉCHARGEMENT DE PHOTO
  Future<void> _uploadPhoto() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() => _isLoading = true);

    try {
      final File file = File(image.path);
      // Nom du fichier : 'avatar_[UUID]_[timestamp].png'
      final String fileName =
          'avatar_${supabase.auth.currentUser!.id}_${DateTime.now().millisecondsSinceEpoch}.png';

      // TÉLÉCHARGEMENT vers le bucket 'avatars'
      // Le path est le chemin du fichier DANS le bucket
      await supabase.storage
          .from('avatars')
          .upload(
            fileName,
            file,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: true),
          );

      // Récupération de l'URL publique
      final String publicUrl = supabase.storage
          .from('avatars')
          .getPublicUrl(fileName);

      // MISE À JOUR de la table profils avec la nouvelle URL
      await supabase
          .from('profils')
          .update({'photo_url': publicUrl})
          .eq('id', supabase.auth.currentUser!.id);

      if (mounted) {
        setState(() => _photoUrl = publicUrl);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Photo de profil mise à jour avec succès!'),
          ),
        );
      }
    } on StorageException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur Storage Supabase: ${e.message}')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Erreur inattendue: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  // Widget réutilisable pour les champs de profil
  Widget _buildProfileField({
    required String hintText,
    required IconData icon,
    required TextEditingController controller,
    bool isEnabled = true,
  }) {
    final Color fieldColor = isEnabled ? kTextFieldColor : Colors.grey.shade300;
    final Color iconColor = isEnabled ? kPrimaryColor : Colors.black26;
    final Color hintColor = isEnabled ? Colors.black45 : Colors.black26;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 55,
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        controller: controller,
        enabled: isEnabled,
        readOnly: !isEnabled,
        style: const TextStyle(color: kPrimaryColor),
        decoration: InputDecoration(
          icon: Icon(icon, color: iconColor),
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // Widget pour le bouton ENREGISTRER
  Widget _buildSaveButton({required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: _isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 5,
        ),
        child: _isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                'ENREGISTRER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kGradientStart, kGradientEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // App Bar Simulé
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(right: 40.0),
                          child: Text(
                            'Profil',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Icône de Profil Circulaire (Cliquable pour l'upload)
                GestureDetector(
                  onTap: _uploadPhoto, // APPEL DE LA LOGIQUE DE CHOIX/UPLOAD
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: _photoUrl != null && _photoUrl!.isNotEmpty
                        ? NetworkImage(_photoUrl!) as ImageProvider
                        : null,
                    child: _photoUrl == null || _photoUrl!.isEmpty
                        ? const Icon(
                            Icons.person,
                            size: 40,
                            color: kGradientStart,
                          )
                        : null,
                  ),
                ),

                const SizedBox(height: 50),

                // Champ E-mail (NON MODIFIABLE)
                _buildProfileField(
                  hintText: 'email',
                  icon: Icons.mail_outline,
                  controller: _emailController,
                  isEnabled: false,
                ),

                const SizedBox(height: 20),

                // Champ Nom
                _buildProfileField(
                  hintText: 'nom',
                  icon: Icons.person_outline,
                  controller: _nomController,
                ),

                const SizedBox(height: 20),

                // Champ Adresse
                _buildProfileField(
                  hintText: 'adresse',
                  icon: Icons.location_on_outlined,
                  controller: _adresseController,
                ),

                const SizedBox(height: 50),

                // Bouton ENREGISTRER
                _buildSaveButton(onPressed: _updateProfile),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
