import 'package:flutter/material.dart';
import 'package:flutterproject/Store/app_store.dart';
import 'package:flutterproject/widget/blockWidget.dart';
import '../widget/navBar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widget/searchBar_widget.dart';

class ListeItemPage extends ConsumerWidget {
  const ListeItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStoreProvider);
    
    // Création de la liste de widget.
    final widgets = <Widget>[];
    
    // Afficher un message si aucun résultat n'est trouvé après une recherche
    if (state.blocks.isEmpty) {
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
              child: Column(
                children: [
                  SearchBarWidget(
                    onSearchChanged: (query) {
                      ref.read(appStoreProvider.notifier).filterBlocks(query);
                    },
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Aucun bloc trouvé",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavBar(currentIndex: 0),
      );
    }
    
    // Sinon, construire la liste des blocs
    state.blocks.forEach((block) {
      widgets.add(BlockWidget(
        nameSpacedId: block.nameSpacedId,
        showText: true,
      ));
    });

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
            child: Column(
              children: [
                SearchBarWidget(
                  onSearchChanged: (query) {
                    ref.read(appStoreProvider.notifier).filterBlocks(query);
                  },
                ),
                Expanded(
                  child: GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    children: widgets,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}
