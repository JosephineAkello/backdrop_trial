import 'package:flutter/material.dart';


class CategoryTile extends StatelessWidget{

  Widget build(context){
    return Material(
      color: Colors.transparent,
      child: Container(
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: category.color['highlight'],
          splashColor: category.color['splash'],
          ),
        ),

      );
  }
}