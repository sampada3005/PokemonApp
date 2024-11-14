import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pokemons.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Pokemon {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? imageurl;
  @HiveField(3)
  String? xdescription;
  @HiveField(4)
  String? ydescription;
  @HiveField(5)
  String? height;
  @HiveField(6)
  String? category;
  @HiveField(7)
  String? weight;
  @HiveField(8)
  List<String>? typeofpokemon;
  @HiveField(9)
  List<String>? weaknesses;
  @HiveField(10)
  List<String>? evolutions;
  @HiveField(11)
  List<String>? abilities;
  @HiveField(12)
  int? hp;
  @HiveField(13)
  int? attack;
  @HiveField(14)
  int? defense;
  @HiveField(15)
  int? special_attack;
  @HiveField(16)
  int? special_defense;
  @HiveField(17)
  int? speed;
  @HiveField(18)
  int? total;
  @HiveField(19)
  String? malePercentage;
  @HiveField(20)
  String? femalePercentage;
  @HiveField(21)
  int? genderless;
  @HiveField(22)
  String? cycles;
  @HiveField(23)
  String? eggGroups;
  @HiveField(24)
  String? evolvedFrom;
  @HiveField(25)
  String? reason;
  @HiveField(26)
  String? baseExp;
  @HiveField(27)
  String? pokemonEnemy;
  Pokemon(
      {this.name,
      this.id,
      this.imageurl,
      this.xdescription,
      this.ydescription,
      this.height,
      this.category,
      this.weight,
      this.typeofpokemon,
      this.weaknesses,
      this.evolutions,
      this.abilities,
      this.hp,
      this.attack,
      this.defense,
      this.special_attack,
      this.special_defense,
      this.speed,
      this.total,
      this.malePercentage,
      this.femalePercentage,
      this.genderless,
      this.cycles,
      this.eggGroups,
      this.evolvedFrom,
      this.reason,
      this.baseExp,
      this.pokemonEnemy});

      factory Pokemon.fromJson(Map<String, dynamic> json) =>
  _$PokemonFromJson(json);
}
