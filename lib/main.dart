import 'package:dream_tickets/features/presentation/pages/AuthentifierPage.dart';
import 'package:dream_tickets/features/presentation/pages/connexionPage.dart';
import 'package:dream_tickets/features/presentation/pages/profile.dart';
import 'package:dream_tickets/features/presentation/pages/reservation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  // await Supabase.initialize(url: dotenv.get("SUPABASE_URL"), anonKey: dotenv.get("SUPABASE_KEY"));
  //di.init();
  runApp(
    MaterialApp(
      title: 'dream_tickets',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => ConnexionPage(),
        // '/': (BuildContext context) => Authentifierpage(),
        // '/': (BuildContext context) => ReservationPage(),
        // '/': (BuildContext context) => ProfilePage(),
      },
    ),
  );
}
