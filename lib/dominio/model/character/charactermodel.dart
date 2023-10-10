import "package:flutter/material.dart";
import "../../entities/character_entitie.dart";
import "package:rickandmortyapp/data/provider/apiservice.dart";
import 'dart:async';

class CharacterModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Character> _characters = [];
  int _nextPageToFetch = 1;
  bool _isFetching = false;

  List<Character> get characters => _characters;

  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }

  void removeCharacter(Character character) {
    _characters.remove(character);
    notifyListeners();
  }

  void updateCharacters(List<Character> characters) {
    _characters = characters;
    notifyListeners();
  }

  Future<void> fetchCharacters() async {
    // Check if we're already fetching characters
    if (_isFetching) return;

    _isFetching = true;

    try {
      List<Character> newCharacters = await _apiService.getCharacters(_nextPageToFetch);
      _characters.addAll(newCharacters);
      _nextPageToFetch++;
      notifyListeners();
    } catch (e) {
      // Manejar algun error
    } finally {
      _isFetching = false;
    }
  }

  Timer _debounce = Timer(Duration.zero, () {});

  Future<void> fetchCharacterByName(String name) async {
    if (_debounce.isActive) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      // Verifica si ya estamos buscando personajes
      if (_isFetching) return;

      _isFetching = true;

      try {
        List<Character> newCharacters = await _apiService.getCharacterByName(name);
        _characters = newCharacters;
        notifyListeners();
      } catch (e) {
        // Manejar algun error
      } finally {
        _isFetching = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debounce.cancel();
  }
}
