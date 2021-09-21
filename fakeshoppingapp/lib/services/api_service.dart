import 'package:fakeshoppingapp/models/category.dart';
import 'package:fakeshoppingapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static var client = http.Client();

  static Future fetchProducts() async {
    var response =
        await client.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return productFromJson(jsonString);
    } else {
      return Get.snackbar('Error', 'Try again after sometime');
    }
  }

  static Future fetchCategories() async {
    var response = await client
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return categoryFromJson(jsonString);
    } else {
      return Get.snackbar('Error', 'Try again after sometime');
    }
  }

  static Future fetchProductDetail(int id) async {
    var response =
        await client.get(Uri.parse('https://fakestoreapi.com/products/$id'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return singleProductFromJson(jsonString);
    } else {
      return Get.snackbar('Error', 'Try again after sometime');
    }
  }
}
