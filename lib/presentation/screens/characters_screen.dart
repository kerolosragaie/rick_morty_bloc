import 'package:flutter/material.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body: const Text(
        "data",
        style: TextStyle(fontSize: 80, color: Colors.red),
      ),
    );
  }
}
