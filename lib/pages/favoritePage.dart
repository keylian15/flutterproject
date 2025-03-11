import 'package:flutter/material.dart';
import '../widget/navBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/Store/app_store.dart';
import 'package:flutterproject/widget/blockWidget.dart';
import '../widget/navBar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStoreProvider);

    final widgets = <Widget>[];
    final favorits = state.nameIdsFavorits;
    for (var nameSpacedId in favorits) {
      widgets.add(BlockWidget(
        nameSpacedId: nameSpacedId,
        showText: true,
      ));
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: GridView(
                  // Parametre grille
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1, // Forme Carré
                  ),
                  children: widgets))
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 2),
    );
  }
}
