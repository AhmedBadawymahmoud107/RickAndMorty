import 'package:bloc/bloc.dart';
import 'package:bloc_broject/data/models/charactars.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
final CharactersRepository charactersRepository;
 List<Character> characters = [] ;  //تعديل هنا




  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
List<Character> getAllCharacters()  {  //تعديل هنا
  charactersRepository.getAllCharacters().then((characters) {
emit(Charactersloaded(characters));
this.characters = characters;

  });
  return characters;
}

}
