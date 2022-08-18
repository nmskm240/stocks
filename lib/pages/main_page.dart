import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(ModalRoute.of(context)!.settings.arguments.toString()),
    );
  }
}
