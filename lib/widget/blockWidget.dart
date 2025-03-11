import 'package:flutter/material.dart';

import '../block_data.dart';

class BlockWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool showText;

  BlockWidget({super.key, required BlockData block, required showName})
      : name = block.name ?? "Nom inconnu",
        imageUrl = block.image ?? "",
        showText = showName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.grey.withValues(alpha: 0, red: 0, blue: 0),
        elevation: 5,
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Tu as sélectionné : ${name}"),
          duration: Duration(seconds: 2),
        ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
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
          (showText) ? Text(
            name ?? "Nom inconnu",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ) : SizedBox(),
        ],
      ),
    );
  }
}