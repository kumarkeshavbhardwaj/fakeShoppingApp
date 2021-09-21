import 'package:flutter/material.dart';


class ShoppingPage extends StatelessWidget {
  const ShoppingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Shopping Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text('Shopping Page'),
      ),
    );
  }
}