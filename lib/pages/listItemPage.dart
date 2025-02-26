import 'package:flutter/material.dart';
import '../widget/navBar_widget.dart';

class ListeItemPage extends StatelessWidget {
  const ListeItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste des éléments")),
      body: Center(
        child: Text("List", style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}
