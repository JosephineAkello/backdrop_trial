import 'package:flutter/material.dart';

class _BackdropPanel extends StatelessWidget{
const _BackdropPanel({
  Key key,
  this.onTap,
  this.onVerticalDragUpdate,
  this.onVerticalDragEnd,
  this.title,
  this.child,
})  : super(key: key);

final VoidCallback onTap;
final GestureDragUpdateCallback onVerticalDragUpdate;
final Widget title;
final Widget child;
}

@override
Widget build(context){
  return Material(

  );
}

class _BackdropTitle extends AnimatedWidget{

}

@override

Widget build(context){
  return DefaultTextStyle(

  );
}