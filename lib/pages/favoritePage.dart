import 'package:flutter/material.dart';
import '../widget/navBar_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favories")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text("Favories", style: TextStyle(fontSize: 24)),
            ),
          ),
          NavBar(currentIndex: 2),
        ],
      ),
    );
  }
}
