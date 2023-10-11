
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/dominio/model/character/charactermodel.dart';
import 'package:rickandmortyapp/presentation/views/CharacterInfo/characterinfo.dart';
import 'package:rickandmortyapp/shared/header/appheader.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  CharacterListState createState() => CharacterListState();
}

class CharacterListState extends State<CharacterList> {
  final ScrollController _scrollController = ScrollController();
  late CharacterModel characterModel;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    characterModel = Provider.of<CharacterModel>(context, listen: false);
    characterModel.fetchCharacters();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      characterModel.fetchCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isMainView: true,
        title:TextField(
          onChanged: (value) {
            characterModel.fetchCharacterByName(value);
          },
          style: const TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
          decoration: const InputDecoration(
            hintText: "Search character...",
            hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        ),
      body: Consumer<CharacterModel>(
        builder: (context, characterModel, child) {
          if (characterModel.characters.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              controller: _scrollController,
              itemCount: characterModel.characters.length,
              itemBuilder: (context, index) {
                var character = characterModel.characters[index];
                return Card(
                  color: Colors.cyan, // Cambia el color de fondo
                  elevation: 5, // Agrega sombreado
                  shape: RoundedRectangleBorder( // Agrega bordes redondeados
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: 85,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(character.image)),
                      title: Text(character.name),
                      subtitle: Text('Specie: ${character.species}, Estate: ${character.status}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharacterInfoPage(character: character),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
