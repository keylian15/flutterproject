import 'package:flutter/material.dart';
import '../widget/navBar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterproject/Store/app_store.dart';
import 'package:flutterproject/widget/blockWidget.dart';

class Craftingpage extends ConsumerWidget {
  const Craftingpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStoreProvider);

    final widgets = <Widget>[];
    state.blocks.forEach((block) {
      widgets.add(BlockWidget(
        nameSpacedId: block.nameSpacedId,
        showText: true,
      ));
    });
  
  return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          // Contenu
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 90), 
                Image.asset(
                  "assets/images/craftingtable.png",
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: state.blocks.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemCount: widgets.length,
                          itemBuilder: (context, index) => widgets[index],
                        ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}