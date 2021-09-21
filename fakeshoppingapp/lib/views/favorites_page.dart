import 'package:fakeshoppingapp/controllers/controller.dart';
import 'package:fakeshoppingapp/views/product_detail_page.dart';
import 'package:fakeshoppingapp/views/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key}) : super(key: key);

  final Controller controller  = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Favorites',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(() {
        if (controller .favoriteProducts.length == 0) {
          return Center(
            child: Text('Click on Heart Icon to make favorite'),
          );
        }
        return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: controller .favoriteProducts.length,
            itemBuilder: (context, index) {
              return ProductTile(
                function: () {
                  controller .checkFav(
                      controller .favoriteProducts[index].id!);
                  print(controller .favoriteProducts[index].id);
                  Get.to(() => ProductDetail());
                  controller .linkToProductDetail(
                      controller .favoriteProducts[index].id!);
                },
                title: controller .favoriteProducts[index].title,
                image: controller .favoriteProducts[index].image,
                price: controller .favoriteProducts[index].price,
              );
            });
      }),
    );
  }
}
