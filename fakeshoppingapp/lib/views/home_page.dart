import 'package:fakeshoppingapp/controllers/controller.dart';
import 'package:fakeshoppingapp/views/category_tile.dart';
import 'package:fakeshoppingapp/views/product_detail_page.dart';
import 'package:fakeshoppingapp/views/product_tile.dart';
import 'package:fakeshoppingapp/views/search_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final Controller controller  = Get.find();

  @override
  Widget build(BuildContext context) {
    var unit = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Myze',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shop,
                color: Colors.black,
              )),
        ],
      ),
      body: Column(
        children: [
          SearchBox(),
          Expanded(
            child: Obx(() {
              if (controller .isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller .searchKeyword.value != '') {
                controller .searchList();
                return buildFilteredList();
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: unit * 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: unit * 5,
                      ),
                      buildCategoryLabel(unit),
                      SizedBox(
                        height: unit * 5,
                      ),
                      buildCategoryView(unit),
                      SizedBox(
                        height: unit * 5,
                      ),
                      buildNewArrivalLabel(unit),
                      SizedBox(
                        height: unit * 5,
                      ),
                      buildNewArrivalView(unit),
                      SizedBox(
                        height: unit * 5,
                      ),
                      Container(
                        child: Text(
                          controller .categoriesList[0].capitalizeFirst!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: unit * 5),
                        ),
                      ),
                      SizedBox(
                        height: unit * 5,
                      ),
                      buildCategory1View(),
                      SizedBox(
                        height: unit * 5,
                      ),
                      Container(
                        child: Text(
                          controller .categoriesList[1].capitalizeFirst!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: unit * 5),
                        ),
                      ),
                      SizedBox(
                        height: unit * 5,
                      ),
                      buildCategory2View(),
                      SizedBox(
                        height: unit * 5,
                      ),
                      Container(
                        child: Text(
                          controller .categoriesList[2].capitalizeFirst!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: unit * 5),
                        ),
                      ),
                      SizedBox(
                        height: unit * 5,
                      ),
                      buildCategory3View(),
                      SizedBox(
                        height: unit * 5,
                      ),
                      Container(
                        child: Text(
                          controller .categoriesList[3].capitalizeFirst!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: unit * 5),
                        ),
                      ),
                      SizedBox(
                        height: unit * 5,
                      ),
                      buildCategory4View(),
                      SizedBox(
                        height: unit * 5,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  ListView buildFilteredList() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          controller 
                            .checkFav(controller .filteredProducts[index].id!);
          Get.to(() => ProductDetail());
          controller .searchKeyword.value = '';
          controller .linkToProductDetail(
              controller .filteredProducts[index].id!);
        },
        title: Text(
          controller .filteredProducts[index].title!,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '\$ ${controller .filteredProducts[index].price}',
        ),
        leading:
            Image.network(controller .filteredProducts[index].image!),
      ),
      itemCount: controller .filteredProducts.length,
    );
  }

  Container buildNewArrivalLabel(double unit) {
    return Container(
      child: Text(
        'New Arrivals',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: unit * 5),
      ),
    );
  }

  Container buildCategory4View() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(
                controller .category4List.length,
                (index) => ProductTile(
                      function: () {
                        controller 
                            .checkFav(controller .category4List[index].id!);
                        // print(controller .category4List[index].id);
                        Get.to(() => ProductDetail());
                        controller .linkToProductDetail(
                            controller .category4List[index].id!);
                      },
                      image: controller .category4List[index].image,
                      title: controller .category4List[index].title,
                      price: controller .category4List[index].price,
                    ))),
      ),
    );
  }

  Container buildCategory3View() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(
                controller .category3List.length,
                (index) => ProductTile(
                      function: () {
                        controller 
                            .checkFav(controller .category3List[index].id!);
                        Get.to(() => ProductDetail());
                        controller .linkToProductDetail(
                            controller .category3List[index].id!);
                      },
                      image: controller .category3List[index].image,
                      title: controller .category3List[index].title,
                      price: controller .category3List[index].price,
                    ))),
      ),
    );
  }

  Container buildCategory2View() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(
                controller .category2List.length,
                (index) => ProductTile(
                      function: () {
                        // print(controller .category2List[index].id);
                        Get.to(() => ProductDetail());
                        controller 
                            .checkFav(controller .category2List[index].id!);
                        controller .linkToProductDetail(
                            controller .category2List[index].id!);
                      },
                      image: controller .category2List[index].image,
                      title: controller .category2List[index].title,
                      price: controller .category2List[index].price,
                    ))),
      ),
    );
  }

  Container buildCategory1View() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(
                controller .category1List.length,
                (index) => ProductTile(
                      function: () {
                        controller 
                            .checkFav(controller .category1List[index].id!);
                        // print(controller .category1List[index].id);
                        Get.to(() => ProductDetail());
                        controller .linkToProductDetail(
                            controller .category1List[index].id!);
                      },
                      image: controller .category1List[index].image,
                      title: controller .category1List[index].title,
                      price: controller .category1List[index].price,
                    ))),
      ),
    );
  }

  Container buildNewArrivalView(double unit) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(
                controller .productList.length,
                (index) => ProductTile(
                      function: () {
                        controller 
                            .checkFav(controller .productList[index].id!);
                        Get.to(() => ProductDetail());
                        controller .linkToProductDetail(
                            controller .productList[index].id!);
                      },
                      image: controller .productList[index].image,
                      title: controller .productList[index].title,
                      price: controller .productList[index].price,
                    ))),
      ),
    );
  }

  Container buildCategoryView(double unit) {
    return Container(
      height: unit * 30,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(
          controller .categoriesList.length,
          (index) => CategoryTile(
            image: controller .thumbnailsList[index],
            title: controller .categoriesList[index].capitalizeFirst,
          ),
        )),
      ),
    );
  }

  Container buildCategoryLabel(double unit) {
    return Container(
      child: Text(
        'Categories',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: unit * 5),
      ),
    );
  }
}
