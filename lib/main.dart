import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stocks/pages/email_login_page.dart';
import 'package:stocks/pages/email_singup_page.dart';
import 'package:stocks/pages/auth_page.dart';
import 'package:stocks/pages/main_page.dart';

import 'firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stocks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/auth",
      routes: {
        "/auth": (context) => AuthPage(),
        "/auth/login": (context) => EmailLoginPage(),
        "/auth/singup": (context) => EmailSingupPage(),
        "/main": (context) => MainPage(),
      },
    );
  }
}
