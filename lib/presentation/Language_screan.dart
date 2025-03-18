import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class LanguageScrean extends StatefulWidget {
  const LanguageScrean({super.key});

  @override
  State<LanguageScrean> createState() => _LanguageScreanState();
}

class _LanguageScreanState extends State<LanguageScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Select Language".tr(),style: TextStyle(color: Colors.white,fontSize: 24),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Arabic".tr(),style: TextStyle(color: Colors.white),),
            onTap: (){
              context.setLocale(Locale("ar"));
              Restart.restartApp();
            },
          ),
          ListTile(
            title: Text("English".tr(),style: TextStyle(color: Colors.white),),
            onTap:(){
              context.setLocale(Locale("en"));
              Restart.restartApp();
            },
          )
        ],
      ),
    );
  }
}
