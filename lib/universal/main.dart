import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase
import '../firebase_options.dart'; // Import Firebase options
import '../screen/screen_home.dart';
import '../screen/screen_run_tracker.dart';
import '../screen/screen_calorie_tracker.dart';
import '../screen/screen_articles.dart';
import '../screen/screen_user_profile.dart';
import '../screen/screen_creator_profile.dart';
import '../data/user_profile_provider.dart'; // Import UserProfileProvider
import 'package:provider/provider.dart'; // Import Provider

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets are initialized before Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProfileProvider>( // Provide UserProfileProvider to the entire app
          create: (context) => UserProfileProvider(),
        ),
      ],
      child: HealthMateApp(),
    ),
  );
}

class HealthMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthMate',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/run_tracker': (context) => RunTrackerScreen(),
        '/calorie_tracker': (context) => CalorieTrackerScreen(),
        '/articles': (context) => ArticlesScreen(),
        '/profile': (context) => ProfileScreen(),
        '/creator_profile': (context) => CreatorProfilePage(),
      },
    );
  }
}
