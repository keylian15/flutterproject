import 'package:flutter/material.dart';
import 'package:flutterproject/Store/app_store.dart';
import 'package:flutterproject/widget/block.dart';
import '../widget/navBar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListeItemPage extends ConsumerWidget {
  const ListeItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStoreProvider);

    final widgets = <Widget>[];
    state.blocks.forEach((block){
      widgets.add(Block());
    });

    print(widgets);

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
            child: ListView(
              children: widgets,
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}
