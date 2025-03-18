import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/data/model/Product_response.dart';
import 'package:flutter/material.dart';
import '/data/api_manger/api_manger.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<ProductResponce>>(
            future: ApiManger().getAllProducts(),

            builder: (context, AsyncSnapshot<List<ProductResponce>> snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              else if (snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              }
              else if (!snapshot.hasData || snapshot.data!.isEmpty){
                return Center(child: Text("No Data"),);
              }
              final List<ProductResponce>? Product = snapshot.data ;
              return GridView.builder(
                itemCount: snapshot.data?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                itemBuilder: (context, index) {
                final ProductResponce item = Product![index];
                return Product_Container(image_url: item.images![0], Product_name: item.title!, Product_price: item.price.toString());
              },);
            },)
      ),
    );
  }
}

class Categorise extends StatelessWidget {
  Categorise({
    super.key,
    required this.category,
    required this.backgroundColor,
    required this.textColor,
  });
  String category ;
  Color backgroundColor ;
  Color textColor ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(category,style: TextStyle(color: textColor),),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}

class Product_Container extends StatelessWidget {
  const Product_Container({
    super.key, required this.image_url, required this.Product_name, required this.Product_price
  });
  final String image_url ;
  final String Product_name ;
  final String Product_price ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 255,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: CachedNetworkImage(imageUrl: image_url),
                ),
                Text(Product_name),
                Text('$Product_price \$'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}