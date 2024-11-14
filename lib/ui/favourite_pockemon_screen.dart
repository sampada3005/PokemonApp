import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/data/models/pokemons.dart';
import 'package:pokemon_app/providers/pokemon_provider.dart';
import 'package:pokemon_app/repos/hive_repos.dart';

class FavouritePockemonScreen extends ConsumerStatefulWidget {
  const FavouritePockemonScreen({super.key});

  @override
  ConsumerState<FavouritePockemonScreen> createState() =>
      _FavouritePockemonScreenState();
}

class _FavouritePockemonScreenState
    extends ConsumerState<FavouritePockemonScreen> {
  List<Pokemon> favPokemons = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref
          .read(hiveRepoProvider)
          .getAllPokemonBoxFromHive()
          .then((pokemonList) {
        log(pokemonList.length);
        setState(() {
          favPokemons = pokemonList;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {

final AsyncValue<int> counterProvider = ref.watch(counterStreamProvider);

    return Scaffold(
        appBar: AppBar(
            title: const Text('Favourites',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))),
        body: favPokemons.isNotEmpty
            ? ListView.builder(
                itemCount: favPokemons.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color.fromARGB(255, 237, 232, 232)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CachedNetworkImage(
                              imageUrl: favPokemons[index].imageurl!,
                              height: 50,
                              fit: BoxFit.fitWidth,
                              placeholder: (context, url) => const Center(
                                child: Icon(Icons.error),
                              ),
                            ),
                            Column(
                              children: [
                                Text(favPokemons[index].name!),
                                Text(favPokemons[index]
                                    .typeofpokemon!
                                    .join(', '))
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  ref
                                      .read(hiveRepoProvider)
                                      .deletePokemonFromHive(
                                          favPokemons[index].id!);
                                        setState(() {
                                          
                                        });
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : const Center(
                child: Text('No pokemon added to Favourires'),
              ));
  }
}
