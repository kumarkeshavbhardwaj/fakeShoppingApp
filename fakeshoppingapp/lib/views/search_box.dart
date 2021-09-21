import 'package:fakeshoppingapp/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {


  final Controller controller  = Get.find();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var unit = MediaQuery.of(context).size.width / 100;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: unit * 5, vertical: unit * 5),
      height: unit * 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      child: TextField(
        controller: textEditingController,
        onChanged: (v) {
          controller .searchKeyword.value = v;
        },
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller .searchKeyword.value = '';
                textEditingController.clear();
              },
            ),
            contentPadding: EdgeInsets.all(unit * 5),
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: 'Search furniture'),
      ),
    );
  }
}
