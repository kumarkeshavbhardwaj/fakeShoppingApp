import 'package:fakeshoppingapp/views/home_page.dart';
import 'package:fakeshoppingapp/views/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Fake Shopping App',
      home: NavigationPage(),
    );
  }
}

