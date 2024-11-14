import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:pokemon_app/data/models/pokemons.dart';

class HiveRepos {
  final pokemonBoxName = 'pokemonBox';

  void registerAdapter() {
    Hive.registerAdapter(PokemonAdapter());
  }

  Future addPokemonToHive(Pokemon pokemon) async {
    final pokemonBox = await Hive.openBox<Pokemon>(pokemonBoxName);
    if (pokemonBox.isOpen) {
      await pokemonBox.put(pokemon.id!, pokemon);
      pokemonBox.close();
    } else {
      throw Exception('Box is not opne');
    }
  }

  Future deletePokemonFromHive(String id) async {
    final pokemonBox = await Hive.openBox<Pokemon>(pokemonBoxName);
    if (pokemonBox.isOpen) {
      pokemonBox.delete(id);
      pokemonBox.close();
    } else {
      throw Exception('Box is not opne');
    }
  }

  Future<List<Pokemon>> getAllPokemonBoxFromHive() async {
    final pokemonBox = await Hive.openBox<Pokemon>(pokemonBoxName);
    if (pokemonBox.isOpen) {
      return pokemonBox.values.toList();
    } else {
      throw Exception('Box is not opne');
    }
  }

  Future<Pokemon> getSiglePokemonBoxFromHive(String id) async {
    final pokemonBox = await Hive.openBox<Pokemon>(pokemonBoxName);
    if (pokemonBox.isOpen) {
      return pokemonBox.get(id) ?? Pokemon();
    } else {
      throw Exception('Box is not opne');
    }
  }
}

final hiveRepoProvider = Provider<HiveRepos>((ref) => HiveRepos());
