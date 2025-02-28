import 'package:flutter/material.dart';
import 'package:flutterproject/Store/app_store.dart';
import 'package:flutterproject/widget/blockWidget.dart';
import '../widget/navBar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListeItemPage extends ConsumerWidget {
  const ListeItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStoreProvider);

    // Création de la liste de widget.
    final widgets = <Widget>[];
    state.blocks.forEach((block) {
      widgets.add(BlockWidget(
        block: block,
      ));
    });

    // Gestion du chargement ou de l'erreur
    if (state.blocks.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // Si aucun bloc n'est disponible
    if (state.blocks.isEmpty) {
      return const Center(child: Text("Aucun élément trouvé."));
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
              child: GridView.builder(
                // Parametre grille
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1, // Forme Carré
                ),
                itemCount: state.blocks.length,
                itemBuilder: (context, index) {
                  return BlockWidget(block: state.blocks[index]);
                },
              ))
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}