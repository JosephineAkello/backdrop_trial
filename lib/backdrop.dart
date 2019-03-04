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
final GestureDragEndCallback onVerticalDragEnd;
final Widget title;
final Widget child;
}

@override
Widget build(context){
  return Material(
    elevation: 2.0,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16.0),
      topRight: Radius.circular(16.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onVerticalDragUpdate:onVerticalDragUpdate,
          onVerticalDragEnd: onVerticalDragEnd,
          onTap: onTap,
          child: Container(
            height: 48.0,
            padding: EdgeInsetsDirectional.only(start: 16.0),
          alignment: AlignmentDirectional.centerStart,
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.subhead,
          child: title,
          ),
          ),
        ),
        Divider(
          height: 1.0,
        ),
        Expanded(
          child: child,
        ),
      ],
    ),

  );
}
}
class _BackdropTitle extends AnimatedWidget{
  final Widget frontTitle;
  final Widget backTitle;

  const _BackdropTitle({
    Key key,
    Listenable listenable,
    this.frontTitle,
    this.backTitle,
  })  :super(key: key, listenable: listenable);


@override
Widget build(context){
  final Animation<double> animation =this.listenable;
  return DefaultTextStyle(
   style: Theme.of(context).primaryTextTheme.title,
   softWrap: false,
   overflow: TextOverflow.ellipsis,

   child: Stack(
     children: <Widget>[
       Opacity(
         opacity: CurvedAnimation(
           parent: ReverseAnimation(animation),
           curve: Interval(0.5, 1.0),
).value,
child: backTitle,
       ),
       Opacity(
         opacity: CurvedAnimation(
           parent: animation,
           curve: Interval(0.5, 1.0),
         ).value,
         child: frontTitle,
       ),
     ],
   ),
  );
}
}

class Backdrop extends StatefulWidget{
  final Category currentCategory;
  final Widget frontPanel;
  final Widget backPanel;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    @required this.currentCategory,
    @required this.frontPanel,
    @required this.backPanel,
    @required this.frontTitle,
    @required  this.backTitle,
  })  : assert(currentCategory != null),
        assert(frontPanel !=null),
        assert(backPanel != null),
        assert(frontTitle !=null),
        assert(backTitle !=null);
  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop> with SingleTickerProviderStateMixin{
 final GlobalKey _backdropkey= GlobalKey(debugLabel: 'Backdrp');
  AnimationController _controller;

  @override
  void initState(){
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }
  @override
  Widget build(contxt){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.currentCategory.color,
      elevation: 0.0,
      leading: IconButton(
        onPressed: _toggleBackdropPanelVisibility,
        icon: AnimatedIcon(
          icon: AnimatedIcons.close_menu,
          progress: _controller.view,
        ),
      ),
      title: _BackdropTitle(
        listenable: _controller.view,
        frontTitle: widget.frontTitle,
        backTitle: widget.backTitle,
      ),
      ),
      body: LayoutBuilder(
        builder: _buildStack,
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}