import 'package:flutter/material.dart';
import '../widget/navBar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterproject/Store/app_store.dart';
import 'package:flutterproject/widget/blockWidget.dart';

class Craftingpage extends ConsumerWidget {
  final String? selectedBlock;

  const Craftingpage({this.selectedBlock, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStoreProvider);

    // Afficher le bloc sélectionné s'il y en a un
    if (selectedBlock != null) {
      print("Bloc sélectionné: $selectedBlock");
      // TODO: Implémenter la logique pour afficher la recette de craft
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 90),
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/craftingtable.png",
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    // Positionnement des cases
                    Positioned(
                      top: 37,
                      left: 7,
                      child: Column(
                        children: [
                          for (int i = 0; i < 3; i++)
                            Row(
                              children: [
                                for (int j = 0; j < 3; j++)
                                  Container(
                                    margin: const EdgeInsets.all(4),
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF8B8B8B),
                                    ),
                                    child: DragTarget<String>(
                                      onAccept: (data) {
                                        // Logique pour accepter un bloc
                                        print("Bloc accepté: $data");
                                      },
                                      builder: (context, candidateData, rejectedData) {
                                        return Container();
                                      },
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    // Slot de résultat
                    Positioned(
                      top: 83,
                      right: 44,
                      child: Container(
                        width: 67,
                        height: 67,
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B8B8B),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}