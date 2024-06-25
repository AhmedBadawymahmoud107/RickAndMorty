import 'package:bloc_broject/constants/my_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/charactars.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Mycolors.myGray,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle:  true,
        title: Text(
          character.name,
          style: TextStyle(
            color: Mycolors.myWhite,
          ),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget charachterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Mycolors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: Mycolors.myWhite,
              fontSize: 16,
            ),
          ),
        ]));
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: Mycolors.myYellow,
      height: 30,
      endIndent: endIndent ,
      thickness: 2,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.myGray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  charachterInfo('episode : ',character.episode.join(' / ')),
                  buildDivider(300),

                  charachterInfo('status : ',character.status),
                  buildDivider(300),

                  charachterInfo('species : ',character.species),
                  buildDivider(300),
                   character.type.isEmpty ? Container() :
                  charachterInfo('type : ',character.type),
                  character.type.isEmpty ? Container() :

                  buildDivider(300),

                  charachterInfo('gender : ',character.gender),
                  buildDivider(300),
                  SizedBox(height: 20,),

                ],
              ),
            ),
                SizedBox(height: 650,)
          ]))
        ],
      ),
    );
  }
}
