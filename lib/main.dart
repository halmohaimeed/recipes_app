import 'package:flutter/material.dart' hide Router;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/core/router.dart';

import 'core/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          title: 'Recipes App',
          theme: ThemeData(
            primarySwatch: Colors.amber,
            primaryColor: Colors.white,
            textTheme: const TextTheme(
              bodyText2: TextStyle(color: Colors.black54)
            )
          ),
          initialRoute: homeRoute,
          onGenerateRoute: (settings) => Router.generateRoute(settings),
        );
      }
    );
  }
}
