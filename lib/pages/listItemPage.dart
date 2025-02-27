import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Store/app_store.dart';
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
    Future.microtask(() => Provider.of<MinecraftStore>(context, listen: false)
        .fetchMinecraftData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MinecraftStore>(
        builder: (context, store, child) {
          // Gestion Chargement
          if (store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Gestion Erreur
          if (store.errorMessage != null) {
            return Center(
                child: Text(store.errorMessage!,
                    style: const TextStyle(color: Colors.red)));
          }

          // Gestion Vide
          if (store.items.isEmpty) {
            return const Center(child: Text("Aucun élément trouvé."));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            // Parametre grille
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // Forme Carré
            ),
            itemCount: store.items.length,
            itemBuilder: (context, index) {
              var item = store.items[index];

              // Créer l'URL dynamique de l'image
              String imageUrl =
                  "https://minecraft-api.vercel.app/images/blocks/${item["name"] ?? "unknown"}.png";

              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  shadowColor:
                      Colors.grey.withValues(alpha: 0, red: 0, blue: 0),
                  elevation: 5,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Tu as sélectionné : ${item["name"]}"),
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
                          }
                        },
                        errorBuilder: (context, error, stackTrace) {
                          // Afficher l'image par défaut si l'URL échoue
                          return Image.asset("assets/images/placeholder.png",
                              fit: BoxFit.contain);
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item["name"] ?? "Nom inconnu",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
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
