import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    this.title,
    this.image,
  }) : super(key: key);

  final String? title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    var unit = MediaQuery.of(context).size.width / 100;
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: Image(image: NetworkImage(image!)))),
          Container(
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(5)),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.white)),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: unit * 3),
      width: unit * 30,
    );
  }
}
