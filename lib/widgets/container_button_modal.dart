import 'package:flutter/material.dart';

Widget ContainerButtonModal({
  required Color? bgColor,
  required double? containerWidth,
  required String itext,
}) {
  return Container(
    height: 60,
    width: containerWidth,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: bgColor,
    ),
    child: Center(
      child: Text(
        itext,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}
