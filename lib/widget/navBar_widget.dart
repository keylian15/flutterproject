import 'package:flutter/material.dart';
import '../pages/CraftingPage.dart';
import '../pages/favoritePage.dart';
import '../pages/listItemPage.dart'; // Import de ListPage

class NavBar extends StatelessWidget {
  final int currentIndex;

  const NavBar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    Widget nextPage;
    switch (index) {
      case 0:
        nextPage = const ListeItemPage();
        break;
      case 1:
        nextPage = const Craftingpage();
        break;
      case 2:
        nextPage = const FavoritePage();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/navBar.png',
              fit: BoxFit.cover,
            ),
          ),
          BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (index) => _onItemTapped(context, index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Liste',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.design_services),
                label: 'Craft',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favories',
              ),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
