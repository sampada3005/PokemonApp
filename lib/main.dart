import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_app/providers/theme_provider.dart';
import 'package:pokemon_app/repos/hive_repos.dart';
import 'package:pokemon_app/themes/styles.dart';
import 'package:pokemon_app/ui/pokemon_list.dart';

void main() async {
  await Hive.initFlutter();
  HiveRepos().registerAdapter();

  runApp(const ProviderScope(child: PokemonApp()));
}

class PokemonApp extends ConsumerStatefulWidget {
  const PokemonApp({super.key});

  @override
  ConsumerState<PokemonApp> createState() => _PokemonAppState();
}

class _PokemonAppState extends ConsumerState<PokemonApp> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(themeProvider.notifier).getSavedTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = ref.watch(themeProvider);

    return MaterialApp(
      theme: Style.themeData(isDarkTheme: theme),
      debugShowCheckedModeBanner: false,
      home: const PokemonListScreen(),
    );
  }
}
