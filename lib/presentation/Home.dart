import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'home_pages/Home_Page.dart';
import 'home_pages/Profile_Page.dart';
import 'home_pages/Search_Page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomeState();
}
int CurrentIndex =0 ;
List<Widget> Pages =[
  Home(),
  SearchPage(),
  ProfilePage(),
] ;
class _HomeState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[CurrentIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label:      "Home".tr()),
        BottomNavigationBarItem(icon: Icon(Icons.search),label:  "Search".tr()),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile".tr()),
      ],
        currentIndex: CurrentIndex,
        onTap: (val){
          setState(() {
            CurrentIndex=val ;
          });
        },
      ),

    );
  }
}

