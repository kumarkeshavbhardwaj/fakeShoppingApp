import 'package:fakeshoppingapp/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key}) : super(key: key);

  final Controller controller  = Get.find();
  @override
  Widget build(BuildContext context) {
    var unit = MediaQuery.of(context).size.width / 100;
    return WillPopScope(
      onWillPop: controller .onBackPress,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: controller .onBackPress),
          title: Text(
            'Product Detail',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: unit * 10),
            child: controller .isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Image.network(
                                controller .product.value.image!,
                                height: unit * 70,
                              ),
                            ),
                            Positioned.fill(
                              child: Padding(
                                padding: EdgeInsets.only(right: unit * 0.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Card(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(90)),
                                    child: InkWell(
                                      onTap: () {
                                        controller .makeFavorite(
                                            controller 
                                                .product.value.id!);
                                      },
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.white,
                                        child:  Icon(
                                        controller .isFav.value ?   Icons.favorite_rounded : Icons.favorite_border_outlined,
                                          color:  Colors.redAccent,
                                          size: unit * 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: unit * 5,
                        ),
                        Text('Title',
                            style: TextStyle(
                                fontSize: unit * 4,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: unit * 5,
                        ),
                        Text(
                          controller .product.value.title!,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: unit * 4,
                          ),
                        ),
                        SizedBox(
                          height: unit * 5,
                        ),
                        Text('Description',
                            style: TextStyle(
                                fontSize: unit * 4,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: unit * 5,
                        ),
                        Text(
                          controller .product.value.description!,
                          style: TextStyle(fontSize: unit * 4),
                        ),
                        SizedBox(
                          height: unit * 5,
                        ),
                        Text('Price',
                            style: TextStyle(
                                fontSize: unit * 4,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: unit * 5,
                        ),
                        Text(
                          '\$ ${controller .product.value.price}',
                          style: TextStyle(fontSize: unit * 4),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
