import 'package:flutter/material.dart';
import '../widget/navBar_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              "Favories",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 2),
    );
  }
}
