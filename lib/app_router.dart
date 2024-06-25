import 'package:bloc_broject/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_broject/data/models/charactars.dart';
import 'package:bloc_broject/data/repository/characters_repository.dart';
import 'package:bloc_broject/data/web_sevrices/characters_web_services.dart';
import 'package:bloc_broject/presentation/screens/Character_Details_Screen.dart';
import 'package:bloc_broject/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';
class AppRouter{

  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter(){
    charactersRepository=CharactersRepository(CharactersWebServices());
    charactersCubit=CharactersCubit(charactersRepository);
}
  Route? generatRoute(RouteSettings settings){
switch(settings.name){
  case CharacterScreen :
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),

       child: CaractersScreen() , ),

    );

  case characterDetailsScreen :
    final character = settings.arguments as Character;
    return MaterialPageRoute(builder: (_) =>CharacterDetailsScreen(character: character) ,);





}
  }
}