// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RowData extends StatelessWidget {

  const RowData({
    Key? key,
    required this.size, 
    required this.text1, 
    required this.text2, 
    required this.image

  }) : super(key: key);

  final Size size;
  final String text1, text2, image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
      children: [
      Image.asset(
        image, 
      width: size.width * 0.12),
      Text(text1, 
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Text(text2, 
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        ),
      ),
      ],
    ),
    );
  }
}
