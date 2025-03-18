import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/api_manger/api_manger.dart';
import '../../data/model/Product_response.dart';
import 'Home_Page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

String? search;

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                label: Text(
                  'Search products...'.tr(),
                  style: TextStyle(color: Colors.grey),
                ),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onSubmitted: (value) {
                setState(() {
                  search = value;
                  print(search);
                });
              },
            ),
            FutureBuilder<ProductResponce>(
              future: ApiManger().searchProducts(search),
              builder: (context, AsyncSnapshot<ProductResponce> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(" "),//snapshot.error.toString()
                  );
                }
                final ProductResponce? Product = snapshot.data;
                final ProductResponce item = Product!;
                return Product_Container(
                    image_url: item.images![0],
                    Product_name: item.title!,
                    Product_price: item.price.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}
