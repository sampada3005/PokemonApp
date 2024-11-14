// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonAdapter extends TypeAdapter<Pokemon> {
  @override
  final int typeId = 0;

  @override
  Pokemon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pokemon(
      name: fields[0] as String?,
      id: fields[1] as String?,
      imageurl: fields[2] as String?,
      xdescription: fields[3] as String?,
      ydescription: fields[4] as String?,
      height: fields[5] as String?,
      category: fields[6] as String?,
      weight: fields[7] as String?,
      typeofpokemon: (fields[8] as List?)?.cast<String>(),
      weaknesses: (fields[9] as List?)?.cast<String>(),
      evolutions: (fields[10] as List?)?.cast<String>(),
      abilities: (fields[11] as List?)?.cast<String>(),
      hp: fields[12] as int?,
      attack: fields[13] as int?,
      defense: fields[14] as int?,
      special_attack: fields[15] as int?,
      special_defense: fields[16] as int?,
      speed: fields[17] as int?,
      total: fields[18] as int?,
      malePercentage: fields[19] as String?,
      femalePercentage: fields[20] as String?,
      genderless: fields[21] as int?,
      cycles: fields[22] as String?,
      eggGroups: fields[23] as String?,
      evolvedFrom: fields[24] as String?,
      reason: fields[25] as String?,
      baseExp: fields[26] as String?,
      pokemonEnemy: fields[27] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Pokemon obj) {
    writer
      ..writeByte(28)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.imageurl)
      ..writeByte(3)
      ..write(obj.xdescription)
      ..writeByte(4)
      ..write(obj.ydescription)
      ..writeByte(5)
      ..write(obj.height)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.weight)
      ..writeByte(8)
      ..write(obj.typeofpokemon)
      ..writeByte(9)
      ..write(obj.weaknesses)
      ..writeByte(10)
      ..write(obj.evolutions)
      ..writeByte(11)
      ..write(obj.abilities)
      ..writeByte(12)
      ..write(obj.hp)
      ..writeByte(13)
      ..write(obj.attack)
      ..writeByte(14)
      ..write(obj.defense)
      ..writeByte(15)
      ..write(obj.special_attack)
      ..writeByte(16)
      ..write(obj.special_defense)
      ..writeByte(17)
      ..write(obj.speed)
      ..writeByte(18)
      ..write(obj.total)
      ..writeByte(19)
      ..write(obj.malePercentage)
      ..writeByte(20)
      ..write(obj.femalePercentage)
      ..writeByte(21)
      ..write(obj.genderless)
      ..writeByte(22)
      ..write(obj.cycles)
      ..writeByte(23)
      ..write(obj.eggGroups)
      ..writeByte(24)
      ..write(obj.evolvedFrom)
      ..writeByte(25)
      ..write(obj.reason)
      ..writeByte(26)
      ..write(obj.baseExp)
      ..writeByte(27)
      ..write(obj.pokemonEnemy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      name: json['name'] as String?,
      id: json['id'] as String?,
      imageurl: json['imageurl'] as String?,
      xdescription: json['xdescription'] as String?,
      ydescription: json['ydescription'] as String?,
      height: json['height'] as String?,
      category: json['category'] as String?,
      weight: json['weight'] as String?,
      typeofpokemon: (json['typeofpokemon'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      evolutions: (json['evolutions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hp: (json['hp'] as num?)?.toInt(),
      attack: (json['attack'] as num?)?.toInt(),
      defense: (json['defense'] as num?)?.toInt(),
      special_attack: (json['special_attack'] as num?)?.toInt(),
      special_defense: (json['special_defense'] as num?)?.toInt(),
      speed: (json['speed'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      malePercentage: json['malePercentage'] as String?,
      femalePercentage: json['femalePercentage'] as String?,
      genderless: (json['genderless'] as num?)?.toInt(),
      cycles: json['cycles'] as String?,
      eggGroups: json['eggGroups'] as String?,
      evolvedFrom: json['evolvedFrom'] as String?,
      reason: json['reason'] as String?,
      baseExp: json['baseExp'] as String?,
      pokemonEnemy: json['pokemonEnemy'] as String?,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'imageurl': instance.imageurl,
      'xdescription': instance.xdescription,
      'ydescription': instance.ydescription,
      'height': instance.height,
      'category': instance.category,
      'weight': instance.weight,
      'typeofpokemon': instance.typeofpokemon,
      'weaknesses': instance.weaknesses,
      'evolutions': instance.evolutions,
      'abilities': instance.abilities,
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'special_attack': instance.special_attack,
      'special_defense': instance.special_defense,
      'speed': instance.speed,
      'total': instance.total,
      'malePercentage': instance.malePercentage,
      'femalePercentage': instance.femalePercentage,
      'genderless': instance.genderless,
      'cycles': instance.cycles,
      'eggGroups': instance.eggGroups,
      'evolvedFrom': instance.evolvedFrom,
      'reason': instance.reason,
      'baseExp': instance.baseExp,
      'pokemonEnemy': instance.pokemonEnemy,
    };
