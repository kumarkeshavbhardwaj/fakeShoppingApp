import 'package:flutter/material.dart';

extension CapExtension on String {
  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}

class ProductTile extends StatelessWidget {
  ProductTile({
    Key? key,
    this.image,
    this.isFav = false,
    this.price,
    this.title,
    this.function,
  }) : super(key: key);

  final String? title;
  final String? image;
  final double? price;
  final Function()? function;

  bool isFav;

  @override
  Widget build(BuildContext context) {
    var unit = MediaQuery.of(context).size.width / 100;
    return InkWell(
      onTap: function == null ? () {} : function,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 2,
          child: Container(
            alignment: Alignment.center,
            height: unit * 45,
            width: unit * 20,
            margin: EdgeInsets.symmetric(horizontal: unit * 5),
            padding: EdgeInsets.symmetric(vertical: unit * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  image!,
                  fit: BoxFit.contain,
                  height: unit * 30,
                ),
                SizedBox(height: unit * 1),
                Text(
                  title!.inCaps,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: unit * 1),
                Text(
                  '\$ $price',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
