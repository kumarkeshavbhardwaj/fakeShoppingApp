import 'package:fakeshoppingapp/controllers/controller.dart';
import 'package:fakeshoppingapp/views/favorites_page.dart';
import 'package:fakeshoppingapp/views/home_page.dart';
import 'package:fakeshoppingapp/views/my_account_page.dart';
import 'package:fakeshoppingapp/views/shopping_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class NavigationPage extends StatelessWidget {
  NavigationPage({Key? key}) : super(key: key);


  final Controller controller  = Get.put(Controller());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: buildCustomTabBar(),
        
        body: Obx(() =>
               IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  HomePage(),
                  ShoppingPage(),
                  FavoritesPage(),
                  MyAccountPage(),
                ],
              ),
        )
);
  }

  Container buildCustomTabBar() {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => controller.changeTabIndex(0), icon: Icon(Icons.home_outlined)),
          IconButton(
              onPressed: () =>  controller.changeTabIndex(1),
              icon: Icon(Icons.shopping_bag_outlined)),
          IconButton(
              onPressed: () =>  controller.changeTabIndex(2),
              icon: Icon(Icons.favorite_border_outlined)),
          IconButton(
              onPressed: () =>  controller.changeTabIndex(3), icon: Icon(Icons.person_outline))
        ],
      ),
    );
  }
}
