import 'package:dio/dio.dart';

import '../model/Product_response.dart';

class apiManger{


  Dio dio = Dio();

  Future<List<ProductResponce>>getAllProducts() async {
    final response = await dio.get('https://api.escuelajs.co/api/v1/products');
    List<dynamic>data = response.data ;
    return data.map((product) => ProductResponce.fromJson(product),).toList();
  }
}