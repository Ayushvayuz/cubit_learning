import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:new_flutter_project/model/get_userdata.dart';

class FetchUserRepo {
  final Dio dio = Dio();
  final String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<UserData>> getUserData() async {
    try {
      var res = await dio.get(url);
      if(res.statusCode==200){
        return (res.data as List).map((json) => UserData.fromJson(json)).toList();
;
      }else{
        throw Error();
      }
      
    } catch (e) {
      log("Error fetching user data: $e");
      throw Exception("Failed to fetch user data");
    }
  }
}
