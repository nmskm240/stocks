import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stocks/utils/authetication.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final credential = await Authetication.google.tryLogin();
                      print(credential.user!.uid);
                    } on FirebaseAuthException catch (e) {
                      //TODO: Error handling
                    }
                  },
                  child: const Text("Googleでサインイン"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("新規登録"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      const Text("アカウントをお持ちの場合は"),
                      TextButton(
                        onPressed: () {},
                        child: const Text("ログイン"),
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("ゲストではじめる"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
