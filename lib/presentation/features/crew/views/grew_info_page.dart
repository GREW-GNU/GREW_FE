import 'package:flutter/material.dart';

class GrewInfoPage extends StatelessWidget {
  const GrewInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GrewInfo")),
      body: Center(child: Text("GREW 정보")),
    );
  }
}
