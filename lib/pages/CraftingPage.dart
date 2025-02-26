import 'package:flutter/material.dart';
import '../widget/navBar_widget.dart'; // Import du NavBar

class Craftingpage extends StatelessWidget {
  const Craftingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crafting")),
      body: Center(
        child: Text("Craft", style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}
