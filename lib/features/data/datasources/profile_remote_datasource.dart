import 'package:dream_tickets/features/data/models/profil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProfilRemoteDataSource {
  Future<ProfilModel> getProfil();
  Future<ProfilModel> updateProfil({
    String? nom,
    String? adresse,
    String? email,
  });
  Future<void> deleteProfil();
}

class ProfilRemoteDataSourceImpl implements ProfilRemoteDataSource {
  final SupabaseClient supabaseClient;

  ProfilRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<ProfilModel> getProfil() async {
    try {
      final userId = supabaseClient.auth.currentUser?.id;
      if (userId == null) throw Exception("Utilisateur non connecté");

      final response = await supabaseClient
          .from('profils')
          .select()
          .eq('id', userId)
          .single();

      return ProfilModel.fromJson(response);
    } catch (e) {
      throw Exception("Erreur lors de la récupération du profil : $e");
    }
  }

  @override
  Future<ProfilModel> updateProfil({
    String? nom,
    String? adresse,
    String? email,
  }) async {
    try {
      final userId = supabaseClient.auth.currentUser?.id;
      if (userId == null) throw Exception("Utilisateur non connecté");

      final updates = <String, dynamic>{};
      if (nom != null) updates['nom'] = nom;
      if (adresse != null) updates['adresse'] = adresse;
      if (email != null) updates['email'] = email;

      final response = await supabaseClient
          .from('profils')
          .update(updates)
          .eq('id', userId)
          .select()
          .single();

      return ProfilModel.fromJson(response);
    } catch (e) {
      throw Exception("Erreur lors de la mise à jour du profil : $e");
    }
  }

  @override
  Future<void> deleteProfil() async {
    try {
      final userId = supabaseClient.auth.currentUser?.id;
      if (userId == null) throw Exception("Utilisateur non connecté");

      // Note : Supprimer dans la table 'profiles' est une chose,
      // mais pour supprimer l'accès, il faut souvent appeler auth.admin.deleteUser
      // ou utiliser une fonction RPC si tu n'es pas admin.
      await supabaseClient.from('profils').delete().eq('id', userId);

      // Optionnel : après suppression
      await supabaseClient.auth.signOut();
    } catch (e) {
      throw Exception("Erreur lors de la suppression du profil : $e");
    }
  }
}
