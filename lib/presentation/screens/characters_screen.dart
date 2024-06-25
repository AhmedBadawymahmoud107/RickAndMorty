import 'package:bloc_broject/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_broject/constants/my_colors.dart';
import 'package:bloc_broject/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../data/models/charactars.dart';

class CaractersScreen extends StatefulWidget {
  const CaractersScreen({super.key});

  @override
  State<CaractersScreen> createState() => _CaractersScreenState();
}

class _CaractersScreenState extends State<CaractersScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedForCharacter;
  bool _isSearching = false;
  final _searchTextControler = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextControler,
      cursorColor: Mycolors.myGray,
      decoration: InputDecoration(
        hintText: 'find a chararcter',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Mycolors.myGray, fontSize: 18),
      ),
      style: TextStyle(color: Mycolors.myGray, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedForCharacter = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _bildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearsearch();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear,
              color: Mycolors.myGray,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: Icon(
              Icons.search,
              color: Mycolors.myGray,
            ))
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    _clearsearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearsearch() {
    setState(() {
      _searchTextControler.clear();
    });
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is Charactersloaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: Mycolors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Mycolors.myGray,
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextControler.text.isEmpty
          ? allCharacters.length
          : searchedForCharacter.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: _searchTextControler.text.isEmpty
              ? allCharacters[index]
              : searchedForCharacter[index],
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      "Characters",
      style: TextStyle(color: Mycolors.myGray),
    );
  }

  Widget buildNoInternetWidget() {
    return Center(
        child: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
              style: TextStyle(fontSize: 22, color: Mycolors.myGray),
              'can\'t connect .. check your internet'),
          Image.asset("assets/images/undraw_Signal_searching_re_yl8n (1).png")
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Mycolors.myYellow,
          leading: _isSearching
              ? BackButton(
                  color: Mycolors.myGray,
                )
              : Container(),
          title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
          actions: _bildAppBarActions(),
        ),
        body: OfflineBuilder(connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return buildBlocWidget();
          } else {
            return buildNoInternetWidget();
          }
        },child:  showLoadingIndicator(),
        ),
    );
  }
}
