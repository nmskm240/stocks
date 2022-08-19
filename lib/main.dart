import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stocks/firebase/firebase_options.dart';
import 'package:stocks/screens/auth/auth_screen.dart';
import 'package:stocks/screens/auth/login_screen.dart';
import 'package:stocks/screens/auth/singup_screen.dart';
import 'package:stocks/screens/main/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Stocks',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute:
            FirebaseAuth.instance.currentUser == null ? "/auth" : "/main",
        routes: {
          "/auth": (context) => AuthScreen(),
          "/auth/login": (context) => LoginScreen(),
          "/auth/singup": (context) => SingupScreen(),
          "/main": (context) => MainScreen(),
        },
      ),
    ),
  );
}
