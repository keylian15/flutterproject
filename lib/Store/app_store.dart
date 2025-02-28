Rommick
rommick
En ligne
Flutter

Rommick — 28/09/2024 13:00
Le soucis c'est que je ne suis plus chez moi
Ezekyel — 28/09/2024 13:04
Mdrrr personne n'est chez soit c'est la merde
Rommick — 28/09/2024 13:04
Mais je te jure je l'ai fini sur le gong avec de la chatte
Ezekyel — 28/09/2024 13:04
J'espère pas rentrer trop tard moi pour le faire
Rommick — 28/09/2024 13:05
Mdrrr
Hippo — 04/02/2025 13:27
Ezekyel — 04/02/2025 13:35
https://github.com/keylian15/FlutterProject.git
Utilisation de :
GIT
DIO
ISAR
RIVERPOD

AFFICHAGE IMAGE
Ezekyel a changé le nom du salon : Flutter — 04/02/2025 13:37
Ezekyel — 04/02/2025 14:12
https://developer.marvel.com/
Rommick — 04/02/2025 14:22
https://docs.papermc.io/paper/1.20/dev/plugin-configurations
Plugin Configurations | PaperMC Docs
How to create configuration files for your plugins to customize behavior.
Image
Rommick — 04/02/2025 14:31
https://www.figma.com/design/img8gk6mvy1pbhHfCzfIBc/Untitled?node-id=0-1&m=dev&t=6HW1WcNy5t9N5MAM-1
Figma
Untitled
Created with Figma
Rommick — 07/02/2025 14:34
Image
Hippo — 07/02/2025 17:16
https://github.com/anish-shanbhag/minecraft-api
GitHub
GitHub - anish-shanbhag/minecraft-api: An API for getting informati...
An API for getting information about the game Minecraft. - anish-shanbhag/minecraft-api
Ezekyel — 26/02/2025 14:13
.
Rommick — 26/02/2025 14:13
Image
Hippo — 26/02/2025 14:30
Image
Rommick — Hier à 13:38
Image
Image
Rommick — Hier à 14:23
Image
Image
Hippo — Hier à 15:09
https://github.com/anish-shanbhag/minecraft-api
https://github.com/PrismarineJS/minecraft-data/tree/master
GitHub
GitHub - anish-shanbhag/minecraft-api: An API for getting informati...
An API for getting information about the game Minecraft. - anish-shanbhag/minecraft-api
GitHub - anish-shanbhag/minecraft-api: An API for getting informati...
GitHub
GitHub - PrismarineJS/minecraft-data: Language independent module p...
Language independent module providing minecraft data for minecraft clients, servers and libraries. - PrismarineJS/minecraft-data
Rommick — Hier à 15:25
Image
Ezekyel — Hier à 20:24
@Hippo Y a moyen tu push les derniers trucs que tu as fait ? Parce que je pull mais j'ai des erreurs
Hippo — Hier à 20:33
je peux pas
Image
Ezekyel — Hier à 20:33
T'as un fichier blockData ?
Hippo — Hier à 20:33
oui
Rommick — Hier à 20:34
Au pire tu mets un commentaire à la con
Ezekyel — Hier à 20:34
Nan attends c'est bon
Je crois
C'est juste que le pull et rebase ne supprime pas les fichiers en trop
Je compile et je test
Ok good
Rommick — Hier à 20:45
Super
Ezekyel — Hier à 22:53
@Rommick @Hippo J'ai de nouveau le meme rendu mais avec tout de correct
Hippo — Hier à 22:54
C'est super
Ezekyel — Hier à 22:54
Et de facon bien structuré
Rommick — Hier à 22:54
Nickel
Ezekyel — Hier à 22:54
Qui veut push ?
Hippo — Hier à 22:55
Je veux bien mais je pense que Romain veut
Rommick — Hier à 22:55
Bas au moins un truc mais j'ai pas l'ordi
Ezekyel — Hier à 22:55
idk apres je vais continuer a bosser vu que je comprends la vous me dites
au pire tenez les fichiers et romain tu le fais limite demain matin
Rommick — Hier à 22:56
Oe azy
Ezekyel — Hier à 22:57
app_store dans le dossier store, blockWidget dans widget (il remplace le fichier block)
import 'dart:convert';

import 'package:flutterproject/helper/api_helper.dart';
import 'package:flutterproject/block_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/blockWidget.dart';

final appStoreProvider = StateNotifierProvider<AppStore, AppStoreState>((ref) {
var apiHelper = ref.watch(apiHelperProvider);
return AppStore(api: apiHelper);
});

class AppStore extends StateNotifier<AppStoreState> {
AppStore({required this.api}) : super(AppStoreState.init()) {
getAllItem();
}

final ApiHelper api;

// TODO : Fonctions utiles
void resetValues(AppStore store, AppStoreState state) {}

void saveValue() {
SharedPreferences.getInstance().then((SharedPreferences prefs) {
// prefs.setDouble(AppConst.weightKey, state.weightKg);
});
}

void getAllItem(){
// Récupération des blocs + Création de ces derniers.
api.get().then((response){
List<dynamic> blocks = json.decode(response.data);

final res = <BlockData>[];
blocks.forEach((block){
res.add(BlockData(
name: block["name"],
nameSpaceId: block["namespaceId"],
image: block["image"]));
});

state = state.copyWith(blocks : res);
});
}
}

class AppStoreState {
//variables
final List<BlockData> blocks;

//constructeur
AppStoreState({required this.blocks});

factory AppStoreState.init() {
return AppStoreState(blocks: []);
}

AppStoreState copyWith({List<BlockData>? blocks}) {
return AppStoreState(blocks: blocks ?? this.blocks);
}
}
Réduire
app_store.dart
2 Ko
import 'package:flutter/material.dart';
import 'package:flutterproject/Store/app_store.dart';
import 'package:flutterproject/widget/blockWidget.dart';
import '../widget/navBar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
Afficher plus
listItemPage.dart
2 Ko
import 'package:flutter/material.dart';

import '../block_data.dart';

class BlockWidget extends StatelessWidget {
final String name;
Afficher plus
blockWidget.dart
3 Ko
et tous est bien structuré faudrait garder cette archi
Hippo — Hier à 22:58
okok je regarderai ça demain du coup
Rommick — Hier à 22:59
Envoie un screen de l'architecture de tes dossiers
Comme ça je fais pas de conneries demain
Ezekyel — Hier à 22:59
Image
Rommick — Hier à 22:59
Super
﻿
import 'dart:convert';

import 'package:flutterproject/helper/api_helper.dart';
import 'package:flutterproject/block_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/blockWidget.dart';

final appStoreProvider = StateNotifierProvider<AppStore, AppStoreState>((ref) {
var apiHelper = ref.watch(apiHelperProvider);
return AppStore(api: apiHelper);
});

class AppStore extends StateNotifier<AppStoreState> {
AppStore({required this.api}) : super(AppStoreState.init()) {
getAllItem();
}

final ApiHelper api;

// TODO : Fonctions utiles
void resetValues(AppStore store, AppStoreState state) {}

void saveValue() {
SharedPreferences.getInstance().then((SharedPreferences prefs) {
// prefs.setDouble(AppConst.weightKey, state.weightKg);
});
}

void getAllItem(){
// Récupération des blocs + Création de ces derniers.
api.get().then((response){
List<dynamic> blocks = json.decode(response.data);

final res = <BlockData>[];
blocks.forEach((block){
res.add(BlockData(
name: block["name"],
nameSpaceId: block["namespaceId"],
image: block["image"]));
});

state = state.copyWith(blocks : res);
});
}
}

class AppStoreState {
//variables
final List<BlockData> blocks;

//constructeur
AppStoreState({required this.blocks});

factory AppStoreState.init() {
return AppStoreState(blocks: []);
}

AppStoreState copyWith({List<BlockData>? blocks}) {
return AppStoreState(blocks: blocks ?? this.blocks);
}
}