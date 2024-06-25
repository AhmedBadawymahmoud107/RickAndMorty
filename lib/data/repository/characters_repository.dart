import 'package:bloc_broject/data/web_sevrices/characters_web_services.dart';
import 'package:flutter/material.dart';
import 'package:bloc_broject/data/models/charactars.dart';

class CharactersRepository{
final CharactersWebServices charactersWebServices;
CharactersRepository(this.charactersWebServices);


Future<List<Character>> getAllCharacters() async {

final  characters = await charactersWebServices.getAllCharacters();
return  characters.map((character)=>Character.fromJson(character)).toList();


}
 }
