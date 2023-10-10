import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/config/themeconfig.dart';
import 'package:rickandmortyapp/dominio/model/character/charactermodel.dart';
import 'package:rickandmortyapp/presentation/views/characterList/characterlist.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CharacterModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty App Test',
      theme: ThemeConfig().themeConfig(),
      debugShowCheckedModeBanner: false,
      home: const CharacterList(),
    );
  }
}


