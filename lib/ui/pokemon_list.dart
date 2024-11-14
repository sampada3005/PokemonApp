import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/data/models/pokemons.dart';
import 'package:pokemon_app/providers/pokemon_provider.dart';
import 'package:pokemon_app/providers/theme_provider.dart';
import 'package:pokemon_app/ui/favourite_pockemon_screen.dart';
import 'package:pokemon_app/ui/pokemon_details_screen.dart';
import 'package:pokemon_app/utils/extensions/buildcontext_extension.dart';
import 'package:pokemon_app/utils/helpers/helpers.dart';

class PokemonListScreen extends ConsumerWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final AsyncValue<List<Pokemon>> pokemonList =
        ref.watch(pokemonFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PokeDex',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (_) => const FavouritePockemonScreen()));
                context.navigateToScreen(const FavouritePockemonScreen());
              },
              icon: const Icon(Icons.favorite)),
          IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).toggleTheme();
              },
              icon: const Icon(Icons.lightbulb))
        ],
      ),
      body: pokemonList.when(data: (data) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.navigateToScreen(
                      PokemonDetailsScreen(pokemon: data[index]));
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 226, 222, 222)),
                        borderRadius: BorderRadius.circular(15.0),
                        color: Helpers.getPokemonCardColour(
                            pokemonType: data[index].typeofpokemon!.first)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: (Image.asset('images/pokeball.png',
                              height: 150, fit: BoxFit.cover)),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Hero(
                            tag: data[index].id!,
                            child: (CachedNetworkImage(
                              imageUrl: data[index].imageurl!,
                              height: 130,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: Icon(Icons.error),
                              ),
                            )),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: (Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].name!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    data[index].category!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 11),
                                  ),
                                ),
                              )
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      }, error: (error, stk) {
        return const Center(child: Text('error while getting data'));
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
