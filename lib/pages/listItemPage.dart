import 'package:flutter/material.dart';
import '../widget/navBar_widget.dart';

class ListeItemPage extends StatelessWidget {
  const ListeItemPage({super.key});

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

          ),
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}
