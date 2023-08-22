import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quote_app/constants/apiconstants.dart';
import 'package:quote_app/model/quote_res.dart';

class QuoteService{
  Dio dio = Dio();

  Future <List<QuoteRes>?> todayquote()async{

    const String path = ApiConstants.todayapi;

    try {

      Response res = await dio.get(path);
      if (res.statusCode == 200 || res.statusCode == 201) {
        final List<dynamic> json = res.data; 
        final  data = json.map((e) => QuoteRes.fromJson(e)).toList();
        return data;
      }
      
    }on DioException catch (e) {
      log(e.message.toString());
    }
    return null; 
  }




  Future <List<QuoteRes>?> allquote()async{

    const String path = ApiConstants.quotesapi;

    try {

      Response res = await dio.get(path);
      if (res.statusCode == 200 || res.statusCode == 201) {
        final List<dynamic> json = res.data; 
        final  data = json.map((e) => QuoteRes.fromJson(e)).toList();
        return data;
      }
      
    }on DioException catch (e) {
      log(e.message.toString());
    }
    return null; 
  }
}