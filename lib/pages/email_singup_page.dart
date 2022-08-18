import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stocks/utils/authetication.dart';
import 'package:stocks/widgets/email_and_password_form.dart';

class EmailSingupPage extends StatelessWidget {
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
                  submitButtonText: "新規登録",
                  onComplet: (email, password) async {
                    try {
                      final credential =
                          await Authetication.email.trySingup(email, password);
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, "/main",
                          arguments: credential);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use:') {
                        //TODO: User email already used process
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
