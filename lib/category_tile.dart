import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CategoryTile extends StatelessWidget{

  Widget build(context){
    return Material(
      color: Colors.transparent,
      child: Container(
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: category.color['highlight'],
          splashColor: category.color['splash'],
          
          onTap: () => onTap(category),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  category.iconLocation,
                  size: 60.0,
                ),
              ),
              Center(
                child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style:Theme.of(context).textTheme.headline,
                ),
              ),
            ],
            ),
          ),
          ),
        ),

      );
  }
}