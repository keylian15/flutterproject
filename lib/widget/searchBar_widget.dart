import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final ValueChanged<String>? onSearchChanged;

  const SearchBarWidget({super.key, this.onSearchChanged});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: 'Rechercher un bloc...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (query) {
          print("Requête de recherche: $query"); // Débogage
          if (widget.onSearchChanged != null) {
            widget.onSearchChanged!(query);
          }
        },
      ),
    );
  }
}






















