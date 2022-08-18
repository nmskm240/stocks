import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stocks/utils/authetication.dart';
import 'package:stocks/widgets/email_and_password_form.dart';

class SinginPage extends StatelessWidget {
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
                      final credential =  await Authetication.email.tryRegist(email, password);
                      print(credential.user!.uid);
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
