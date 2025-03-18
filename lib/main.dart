import 'package:e_commerce_app/presentation/Home.dart';
import 'package:e_commerce_app/presentation/Sign_in.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'Sales_App/Home_Screan.dart';
// import 'Session_3_task/Session_3_task.dart';
// import 'BMI_Calculator/Calculation_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      errorWidget: (message) => Text(message.toString()),
      supportedLocales: [
        Locale('ar'),
        Locale('en')
      ],
      path: 'assets/translations/',
      child: MyApp(),
      fallbackLocale: Locale('en'),
      saveLocale: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SignIn(),
    );
  }
}
