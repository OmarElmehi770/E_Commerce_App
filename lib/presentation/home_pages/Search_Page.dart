import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 50,),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,color: Colors.grey,),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                label: Text('Search products...',style: TextStyle(color: Colors.grey),),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              controller: SearchController(),
              onSubmitted: (value) {

              },
            ),
          ],
        ),
      ),
    );
  }
}
