import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Store/PaperMcAPI.dart';
import '../widget/navBar_widget.dart';

class ListeItemPage extends StatefulWidget {
  const ListeItemPage({super.key});

  @override
  _ListeItemPageState createState() => _ListeItemPageState();
}

class _ListeItemPageState extends State<ListeItemPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<MinecraftStore>(context, listen: false).fetchMinecraftData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste des éléments")),
      body: Consumer<MinecraftStore>(
        builder: (context, store, child) {
          if (store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (store.errorMessage != null) {
            return Center(child: Text(store.errorMessage!, style: const TextStyle(color: Colors.red)));
          }

          if (store.items.isEmpty) {
            return const Center(child: Text("Aucun élément trouvé."));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 éléments par ligne
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // Carré
            ),
            itemCount: store.items.length,
            itemBuilder: (context, index) {
              var item = store.items[index];
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  shadowColor: Colors.grey.withOpacity(0.5),
                  elevation: 5,
                ),
                onPressed: () {
                  // Action lors du clic sur un item
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Tu as sélectionné : ${item["name"]}"))
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(
                        "https://minecraft-api.vercel.app/images/blocks/${item["namespacedId"] ?? "unknown"}.png",
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset("assets/images/placeholder.png", fit: BoxFit.contain);
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item["name"] ?? "Nom inconnu",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}
