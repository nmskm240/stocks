import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stocks/utils/authetication.dart';
import 'package:stocks/widgets/email_and_password_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              children: [
                EmailAndPassworkForm(
                  submitButtonText: "ログイン",
                  onComplet: (email, password) async {
                    try {
                      final credential =
                          await Authetication.email.tryLogin(email, password);
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, "/main",
                          arguments: credential);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        //TODO: No user found for that email process
                      } else if (e.code == 'wrong-password') {
                        //TODO: Wrong password provided for that user process
                      } else if (e.code == "user-disabled") {
                        //TODO: user corresponding to the given email has been disabled process
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
