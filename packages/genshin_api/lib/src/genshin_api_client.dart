import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:genshin_api/src/models/character.dart';
import 'package:http/http.dart' as http;

/// Exception throw when the characters/{name} is not found
class CharacterNotFound implements Exception {}

/// Exception throw when there is no character return from 'characters/all'
class EmptyCharacterList implements Exception {}

class GenshinApiClient {
  static const _baseUrl = "https://api.genshin.dev";
  final http.Client _httpClient;

  GenshinApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<List<Character>> getAllCharacters() async {
    // List<Character> characterList = List<Character>[];
    var url = Uri.parse("$_baseUrl/characters/all");

    var response = await _httpClient.get(url);

    if (kDebugMode) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    }

    final Iterable charactersList = jsonDecode(response.body);

    if (charactersList.isEmpty) {
      throw EmptyCharacterList();
    }
    
    return List<Character>.from(
        charactersList.map((e) => Character.fromJson(e)));
  }
}
