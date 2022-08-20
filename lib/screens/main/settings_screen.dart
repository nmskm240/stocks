import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("設定"),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("サインアウト"),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text("確認"),
                    content: const Text("サインアウトしますか？"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: const Text("OK"),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacementNamed(context, "/auth");
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
