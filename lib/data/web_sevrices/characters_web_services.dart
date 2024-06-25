// //
// // import 'dart:convert';
// // import 'package:bloc_broject/constants/strings.dart';
// // import 'package:dio/dio.dart';
// //
// // class CharactersWebServices {
// //   late Dio dio;
// //
// //   CharactersWebServices() {
// //     BaseOptions options = BaseOptions(
// //       baseUrl: baseUrl,
// //       receiveDataWhenStatusError: true,
// //       connectTimeout: Duration(seconds: 20),
// //       receiveTimeout: Duration(seconds: 20),
// //     );
// //
// //     dio = Dio(options);
// //   }
// //
// //   Future<void> fetchCharacters() async {
// //     try {
// //       var response = await dio.request(
// //         'https://rickandmortyapi.com/api/character',
// //         options: Options(
// //           method: 'GET',
// //         ),
// //       );
// //
// //       if (response.statusCode == 200) {
// //         print(json.encode(response.data));
// //       } else {
// //         print(response.statusMessage);
// //       }
// //     } catch (e) {
// //       print(e);
// //     }
// //   }
// // }
// //
//
//
//
//
//
//
//
//
//
//
//

// import 'dart:convert';
// import 'package:bloc_broject/constants/strings.dart';
// import 'package:dio/dio.dart';
// class CharactersWebServices {
//   late Dio dio;
//   CharactersWebServices() {
//     BaseOptions options = BaseOptions(
//       baseUrl: baseUrl,
//       receiveDataWhenStatusError: true,
//       connectTimeout: Duration(seconds: 20),
//       receiveTimeout: Duration(seconds: 20),
//     );
//     dio = Dio(options);
//   }
//   Future<List<dynamic>> getAllCharacters() async {
//   try{
//     Response response = await dio.get('character');
//     print(response.data.toString());
//     return response.data;
//   }catch(e){
//     print(e.toString());
//     return[];       }   }   }








import 'dart:convert';
import 'package:bloc_broject/constants/strings.dart'; // تأكد من أن `baseUrl` تم تعريفه هنا بشكل صحيح
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl, // تأكد من أن هذا هو URL الأساسي الصحيح
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character'); // تأكد من أن المسار صحيح
      if (response.statusCode == 200) {
        print(response.data.toString());
        return response.data['results']; // الحصول على قائمة الشخصيات
      } else {
        print('Error: ${response.statusMessage}');
        return [];
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      if (e.response != null) {
        print('Error response: ${e.response?.data}');
      }
      return [];
    } catch (e) {
      print('Unexpected error: $e');
      return [];
    }
  }
}
