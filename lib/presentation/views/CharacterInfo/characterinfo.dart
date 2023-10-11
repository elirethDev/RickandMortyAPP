import 'package:flutter/material.dart';
import 'package:rickandmortyapp/dominio/entities/character_entitie.dart';
import 'package:rickandmortyapp/shared/header/appheader.dart';

class CharacterInfoPage extends StatelessWidget {
  final Character character;

  const CharacterInfoPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleAlt: Text(character.name)
      ),
      body: Container(
        color: Colors.cyan, // Cambia el color de fondo
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Centra los elementos en la Row
          children: <Widget>[
            Flexible(
               child: Center( // Centra la imagen
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0), // Redondea los bordes
      child: Image.network(character.image),
    ),
  ),
),
            const SizedBox(width: 10), // Agrega un espacio de 10px
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centra el texto
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Name: ${character.name}', style: const TextStyle(fontSize: 18)),
                  Text('Estate: ${character.status}', style: const TextStyle(fontSize: 18)),
                  Text('Species: ${character.species}', style: const TextStyle(fontSize: 18)),
                  Text('Génder: ${character.gender}', style: const TextStyle(fontSize: 18)),
                  Text('Origin: ${character.origin['name']}', style: const TextStyle(fontSize: 18)),
                  Text('Location: ${character.location['name']}', style: const TextStyle(fontSize: 18)),
                  Text('Episodes: ${character.episode.length}', style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
