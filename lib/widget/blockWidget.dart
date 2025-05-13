import 'package:flutter/material.dart';
import 'package:flutterproject/block_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Store/app_store.dart';
import '../pages/CraftingPage.dart';  // Ajoutez cet import

class BlockWidget extends ConsumerWidget {
  final String nameSpacedId;

  final bool showText;

  BlockWidget({super.key, required String nameSpacedId, bool? showText})
      : nameSpacedId = nameSpacedId,
        showText = showText ?? false;

  Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>>
      manageFavorite(
          BuildContext context, AppStore store, String nameSpacedId) async {
    BlockData blockData = store.getBloc(nameSpacedId);
    String? name = blockData.name;

    if (await store.isFavorite(nameSpacedId)) {
      store.removeFavorite(
          nameSpacedId); // Fonction a changer pour la mettre avec celle du craft

      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Tu as enlevé des favoris : ${name}"),
        duration: Duration(seconds: 1),
      ));
    } else {
      store.addFavorite(
          nameSpacedId); // Fonction a changer pour la mettre avec celle du craft

      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Tu as mis en favoris : ${name}"),
        duration: Duration(seconds: 1),
      ));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppStore store = ref.watch(appStoreProvider.notifier);

    BlockData blockData = store.getBloc(nameSpacedId);
    String? name = blockData.name;
    String? imageUrl = blockData.image;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.grey.withValues(alpha: 0, red: 0, blue: 0),
        elevation: 5,
      ),
      onPressed: () async {
        manageFavorite(context, store, nameSpacedId);
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Craftingpage(selectedBlock: name),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                imageUrl!,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/placeholder.png",
                      fit: BoxFit.contain);
                },
              ),
            ),
            const SizedBox(height: 8),
            (showText)
                ? Text(
                    name ?? "Nom inconnu",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
