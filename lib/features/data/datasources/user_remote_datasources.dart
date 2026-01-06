import 'package:dream_tickets/features/data/models/User.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password);
  Future<void> logout();
  Future<UserModel?> getCurrentUser();
  bool isUserLoggedIn();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final SupabaseClient supabase;

  UserRemoteDataSourceImpl(this.supabase);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        return UserModel(
          id: response.user!.id,
          email: response.user!.email ?? '',
        );
      } else {
        throw Exception("utilisateur no trouve");
      }

      //  return UserModel.fromJSON(response.user!.toJson());
    } catch (e) {
      throw Exception("Erreur de connexion: $e");
    }
  }

  @override
  Future<UserModel> register(String email, String password) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user == null)
        throw Exception("Erreur lors de l'inscription");

      return UserModel.fromJSON(response.user!.toJson());
    } catch (e) {
      throw Exception("Erreur d'inscription: $e");
    }
  }

  @override
  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      return UserModel.fromJSON(user.toJson());
    }
    return null;
  }

  @override
  bool isUserLoggedIn() {
    return supabase.auth.currentSession != null;
  }
}
