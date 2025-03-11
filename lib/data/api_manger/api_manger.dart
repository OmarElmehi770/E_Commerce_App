import 'package:dio/dio.dart';
import '../../presentation/home_pages/Search_Page.dart';
import '../model/Product_response.dart';

class apiManger{
String baseUrl ='https://api.escuelajs.co/api/v1/products/' ;

  Dio dio = Dio();

  Future<List<ProductResponce>>getAllProducts() async {

    final response = await dio.get(baseUrl);

    List<dynamic>data = response.data ;

    return data.map((product) => ProductResponce.fromJson(product),).toList();

  }

Future<ProductResponce> searchProducts (searchProduct)  async {
    final searchResponce = await dio.get(baseUrl+searchProduct);

    var data = searchResponce.data ;
    print("data is $data") ;
    return ProductResponce.fromJson(data );
  }

}