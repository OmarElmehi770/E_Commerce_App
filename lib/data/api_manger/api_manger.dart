import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../presentation/home_pages/Search_Page.dart';
import '../model/Product_response.dart';
import '../model/register_responce.dart';

class ApiManger {
//String baseUrl ='https://api.escuelajs.co/api/v1/products/' ;

  Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api.escuelajs.co/api/v1/',
  ))
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }));

  Future<List<ProductResponce>> getAllProducts() async {
    final response = await dio.get('products/');

    List<dynamic> data = response.data;

    return data
        .map(
          (product) => ProductResponce.fromJson(product),
        )
        .toList();
  }

  Future<ProductResponce> searchProducts(searchProduct) async {
    final searchResponce = await dio.get('products/$searchProduct');

    var data = searchResponce.data;
    print("data is $data");
    return ProductResponce.fromJson(data);
  }

  Future<RegisterResponce?>register(
    String name,
    String email,
    String password,
  ) async {
    try {
      final Response = await dio.post('users/', data: {
        "email": email,
        "password": password,
        "name": name,
        "avatar": "https://i.imgur.com/LDOO4Qs.jpg",
      });

      return RegisterResponce.fromJson(Response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  signIn(
    String email,
    String password,
  ) async {
    try {
      final Response = await dio.post('auth/login/', data: {
        "email": email,
        "password": password,
      });

      return RegisterResponce.fromJson(Response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
