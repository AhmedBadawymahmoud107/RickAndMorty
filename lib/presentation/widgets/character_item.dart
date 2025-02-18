import 'package:bloc_broject/constants/my_colors.dart';
import 'package:bloc_broject/constants/strings.dart';
import 'package:bloc_broject/data/models/charactars.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Mycolors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetailsScreen ,arguments: character),
        child: GridTile(
          
          child: Hero(
            tag: character.id,
            child: Container(
                color: Mycolors.myGray,
                child: character.image.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: "assets/images/loading.gif",
                        image: character.image,
                        fit: BoxFit.cover)
                    : Image.asset("assets/images/ahmed.jpeg")),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.name}',
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: Mycolors.myWhite,
                fontWeight: FontWeight.bold,
              ),
            overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}






































//
// import 'package:bloc_broject/constants/my_colors.dart';
// import 'package:flutter/material.dart';
//
// import '../../data/models/charactars.dart';
//
// class CharacterItem extends StatelessWidget {
//   final Result character; // تعديل هنا ليكون من نوع Result وليس Character
//
//   const CharacterItem({super.key, required this.character});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//       padding: EdgeInsetsDirectional.all(4),
//       decoration: BoxDecoration(
//         color: Mycolors.myWhite,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: GridTile(
//         child: Container(
//             color: Mycolors.myGray,
//             child: character.image.isNotEmpty
//                 ? FadeInImage.assetNetwork(
//                 width: double.infinity,
//                 height: double.infinity,
//                 placeholder: "assets/images/loading.gif",
//                 image: character.image,
//                 fit: BoxFit.cover)
//                 : Image.asset("assets/images/ahmed.jpeg")),
//         footer: Container(
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           color: Colors.black54,
//           alignment: Alignment.bottomCenter,
//           child: Text(
//             character.name,
//             style: TextStyle(
//               height: 1.3,
//               fontSize: 16,
//               color: Mycolors.myWhite,
//               fontWeight: FontWeight.bold,
//             ),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 2,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
