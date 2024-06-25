// class Character {
//   Info? info;
//   List<Result>? results;
//
//   Character({this.info, this.results});
//
//   Character.fromJson(Map<String, dynamic> json) {
//     info = json['info'] != null ? Info.fromJson(json['info']) : null;
//     if (json['results'] != null) {
//       results = <Result>[];
//       json['results'].forEach((v) {
//         results!.add(Result.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     if (info != null) {
//       data['info'] = info!.toJson();
//     }
//     if (results != null) {
//       data['results'] = results!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Info {
//   int? count;
//   int? pages;
//   String? next;
//   dynamic prev;
//
//   Info({this.count, this.pages, this.next, this.prev});
//
//   Info.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     pages = json['pages'];
//     next = json['next'];
//     prev = json['prev'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['count'] = count;
//     data['pages'] = pages;
//     data['next'] = next;
//     data['prev'] = prev;
//     return data;
//   }
// }
//
// class Result {
//   late int id;
//   late String name;
//   late String status;
//   late String species;
//   late String type;
//   late String gender;
//   Origin? origin;
//   Origin? location;
//   late String image;
//   late List<String> episode;
//   late String url;
//   late String created;
//
//   Result(
//       {required this.id,
//         required this.name,
//         required this.status,
//         required this.species,
//         required this.type,
//         required this.gender,
//         this.origin,
//         this.location,
//         required this.image,
//         required this.episode,
//         required this.url,
//         required this.created});
//
//   Result.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     status = json['status'];
//     species = json['species'];
//     type = json['type'];
//     gender = json['gender'];
//     origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
//     location = json['location'] != null ? Origin.fromJson(json['location']) : null;
//     image = json['image'];
//     episode = List<String>.from(json['episode']);
//     url = json['url'];
//     created = json['created'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['id'] = id;
//     data['name'] = name;
//     data['status'] = status;
//     data['species'] = species;
//     data['type'] = type;
//     data['gender'] = gender;
//     if (origin != null) {
//       data['origin'] = origin!.toJson();
//     }
//     if (location != null) {
//       data['location'] = location!.toJson();
//     }
//     data['image'] = image;
//     data['episode'] = episode;
//     data['url'] = url;
//     data['created'] = created;
//     return data;
//   }
// }
//
// class Origin {
//   late String name;
//   late String url;
//
//   Origin({required this.name, required this.url});
//
//   Origin.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     url = json['url'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['name'] = name;
//     data['url'] = url;
//     return data;
//   }
// }












//
// class Character {
//   late int charId;
//   late String name;
//   late String nickName;
//   late String image;
//   late List<dynamic> jobs;
//   late String statusIfDeadOrAlive;
//   late List<dynamic> appearanceOfSeasons;
//   late String acotrName;
//   late String categoryForTwoSeries;
//   late List<dynamic> betterCallSaulAppearance;
//
//   Character.fromJson(Map<String, dynamic> json) {
//     charId = json["char_id"];
//     name = json["name"];
//     nickName = json["nickname"];
//     image = json["img"];
//     jobs = json["occupation"];
//     statusIfDeadOrAlive = json["status"];
//     appearanceOfSeasons = json["appearance"];
//     acotrName = json["portrayed"];
//     categoryForTwoSeries = json["category"];
//     betterCallSaulAppearance = json["better_call_saul_appearance"];
//   }
// }
//

class Character {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late Origin origin;
  late Location location;
  late String image;
  late List<String> episode;
  late String url;
  late String created;

  Character.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    status = json["status"];
    species = json["species"];
    type = json["type"];
    gender = json["gender"];
    origin = Origin.fromJson(json["origin"]);
    location = Location.fromJson(json["location"]);
    image = json["image"];
    episode = List<String>.from(json["episode"]);
    url = json["url"];
    created = json["created"];
  }
}

class Origin {
  late String name;
  late String url;

  Origin.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }
}

class Location {
  late String name;
  late String url;

  Location.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }
}















