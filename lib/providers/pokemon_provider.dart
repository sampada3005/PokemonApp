import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/data/models/pokemons.dart';
import 'package:pokemon_app/repos/pokemon_repo.dart';

final pokemonFutureProvider = FutureProvider<List<Pokemon>>((ref) async {
  return await ref.watch(PokemonRepoProvider).getAllPokemons();
});

final counterStreamProvider = StreamProvider.autoDispose<int>((ref) async* {
  int counter = 0;
  while (counter < 20) {
    await Future.delayed(const Duration(microseconds: 20));
    yield counter++;
  }
});
