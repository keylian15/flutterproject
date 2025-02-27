import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Store/PaperMcAPI.dart';
import 'pages/listItemPage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MinecraftStore(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minecraft Items',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ListeItemPage(),
    );
  }
}
