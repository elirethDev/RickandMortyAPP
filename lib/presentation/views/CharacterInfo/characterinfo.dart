import 'package:flutter/material.dart';
import 'package:rickandmortyapp/dominio/entities/character_entitie.dart';

class CharacterInfoPage extends StatelessWidget {
  final Character character;

  const CharacterInfoPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nombre: ${character.name}'),
            Text('Estado: ${character.status}'),
            Text('Especie: ${character.species}'),
            Text('Género: ${character.gender}'),
            Text('Origen: ${character.origin['name']}'),
            Text('Ubicación: ${character.location['name']}'),
            Image.network(character.image),
            Text('Episodios: ${character.episode.length}'),
          ],
        ),
      ),
    );
  }
}