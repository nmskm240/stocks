import 'package:flutter/material.dart';

class EmailAndPassworkForm extends StatefulWidget {
  final String submitButtonText;
  final Function(String email, String password) onComplet;

  const EmailAndPassworkForm(
      {required this.submitButtonText, required this.onComplet, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EmailAndPasswordFormState();
  }
}

class _EmailAndPasswordFormState extends State<EmailAndPassworkForm> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              icon: Icon(Icons.email),
              filled: true,
              labelText: "メールアドレス",
            ),
            validator: (value) {
              if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!)) {
                return null;
              }
              return "メールアドレスを入力してください。";
            },
          ),
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            autocorrect: false,
            enableInteractiveSelection: false,
            obscureText: true,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              icon: Icon(Icons.password),
              filled: true,
              labelText: "パスワード",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "パスワードを入力してください。";
              } else if (value.length < 6) {
                return "パスワードは6文字以上にする必要があります。";
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: (() {
              if (_key.currentState!.validate()) {
                widget.onComplet(emailController.text, passwordController.text);
              }
            }),
            child: Text(widget.submitButtonText),
          )
        ],
      ),
    );
  }
}
