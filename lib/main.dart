import 'package:firebase_auth/firebase_auth.dart';
import 'package:expensetracker/Screens/addScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      if (FirebaseAuth.instance.currentUser != null) {
        print(FirebaseAuth.instance.currentUser?.uid);
      }
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddScreen(),
    );
  }
}
