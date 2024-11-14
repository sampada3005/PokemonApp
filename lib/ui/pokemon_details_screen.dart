import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/data/models/pokemons.dart';
import 'package:pokemon_app/repos/hive_repos.dart';
import 'package:pokemon_app/ui/rotating_image_widget.dart';
import 'package:pokemon_app/utils/extensions/buildcontext_extension.dart';
import 'package:pokemon_app/utils/helpers/helpers.dart';

class PokemonDetailsScreen extends ConsumerStatefulWidget {
  const PokemonDetailsScreen({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  ConsumerState<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends ConsumerState<PokemonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Helpers.getPokemonCardColour(
            pokemonType: widget.pokemon.typeofpokemon!.first),
        appBar: AppBar(
          title: Text(widget.pokemon.name!,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(onPressed: (){
              ref.read(hiveRepoProvider).addPokemonToHive(widget.pokemon);
              Navigator.pop(context);
            }, icon: const Icon(Icons.favorite))
          ],
        ),
        body: Stack(
          children: [
             Positioned(
                left: context.getWidth(percentage: 0.5) - 125,
                top: 50,
                child: const RotatingImageWidget(imagePath: 'images.pokeball.png')),
            Positioned(
                left: 0,
                top: 250,
                right: 0,
                bottom: 0,
                child: Container(
                  height: context.getHeight(percentage: 0.5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.pokemon.ydescription!,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          PokemonFieldUIWidget(
                              title: "Name", data: widget.pokemon.name!),
                          PokemonFieldUIWidget(
                              title: "Type",
                              data: widget.pokemon.typeofpokemon!.join(', ')),
                          PokemonFieldUIWidget(
                              title: "Weakness",
                              data: widget.pokemon.weaknesses!.join(', ')),
                          PokemonFieldUIWidget(
                              title: "weight", data: widget.pokemon.name!),
                          PokemonFieldUIWidget(
                              title: "Speed", data: widget.pokemon.name!),
                          PokemonFieldUIWidget(
                              title: "Attack", data: widget.pokemon.name!),
                        ],
                      ),
                    ),
                  ),
                )),
            Positioned(
              left: context.getWidth(percentage: 0.5) - 125,
              top: 50,
              child: Hero(
                tag: widget.pokemon.id!,
                child: CachedNetworkImage(
                  imageUrl: widget.pokemon.imageurl!,
                  height: 250,
                  fit: BoxFit.fitWidth,
                  placeholder: (context, url) => const Center(
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            )
          ],
        )

        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: Column(
        //     //mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       CachedNetworkImage(
        //         imageUrl: widget.pokemon.imageurl!,
        //         height: 130,
        //         fit: BoxFit.cover,
        //         placeholder: (context, url) => const Center(
        //           child: Icon(Icons.error),
        //         ),
        //       ),
        //       SizedBox(height: 20),
        //       Text(widget.pokemon.name!,
        //           style: const TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold,
        //               fontSize: 20)),
        //       SizedBox(height: 20),
        //       Text(
        //         widget.pokemon.ydescription!,
        //         style: const TextStyle(
        //             color: Colors.white,
        //             fontWeight: FontWeight.normal,
        //             fontSize: 15),
        //         textAlign: TextAlign.center,
        //       ),
        //     ],
        //   ),
        // )
        );
  }
}

class PokemonFieldUIWidget extends StatelessWidget {
  const PokemonFieldUIWidget({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: context.getWidth(percentage: 0.3),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
          ),
          Text(data,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15))
        ],
      ),
    );
  }
}
