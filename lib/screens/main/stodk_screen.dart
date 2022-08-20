import 'package:flutter/material.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("在庫"),
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
