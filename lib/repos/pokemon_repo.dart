import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/data/models/pokemons.dart';
import 'package:pokemon_app/network/dio_client.dart';
import 'package:pokemon_app/utils/helpers/constants.dart';

class PokemonRepo {
  final Ref ref;

  PokemonRepo({required this.ref});

  Future getAllPokemons() async {
    try {
      final response = await ref.read(dioProvider).get(POKEMON_API_URL);
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.data);
      List<Pokemon> pokemonList = decodedJson
          .map<Pokemon>((pokemon) => Pokemon.fromJson(pokemon))
          .toList();
      log(pokemonList.length.toString());
      return pokemonList;
    } else {
      return Future.error('Failed to get products');
    }
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}

final PokemonRepoProvider = Provider((ref) => PokemonRepo(ref: ref));
