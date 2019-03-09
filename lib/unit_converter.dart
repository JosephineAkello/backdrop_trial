import 'package:flutter/material.dart';

const _padding = EdgeInsets.all(16.0);

class UnitConverter extends StatefulWidget{

final Category category;

const UnitConverter({
  @required this.category,
}) : assert(category != null);

@override
_UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter>{
 Unit _fromValue;
 Unit _toValue;
 double _inputValue;
 String _convertedValue ='';
 List<DropdownMenuItem> _unitMenuItems;
 bool _showValidationError = false;

 @override 
 void initState(){
   super.initState();
   _createDropdownMenuItems();
   _setDefaults();
 }
 @override
 void didUpdateWidget(UnitConverter old){
   super.didUpdateWidget(old);
   if(old.category != widget.category){
     _createDropdownMenuItems();
     _setDefaults();
   }
 }

 @override
 void _createDropdownMenuItems(){
   var newItems =<DropdownMenuItem>[];
   for(var unit in widget.category.units){
     newItems.add(DropdownMenuItem(
       value: unit.name,
       child: Container(
         child: Text(
           unit.name,
           softWrap: true,
         ),
         ),
         ));
   }
 }
  @override
  Widget build(context){
    final input =Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          style: Theme.of(context).textTheme.display1,
          decoration: InputDecoration(
            labelStyle: Theme.of(context).textTheme.display1,
            errorText: _showValidationError ?'Invalid number entered' : null,
            labelText: 'Input',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
          keyboardType: TextInputType.number,
          onChanged: _updateInputValue,
        ),
        _createDropdown(_fromValue.name, _updateFromConversion),

      ],
      ),
    );
    return Padding(
      padding: _padding,
      child: converter,
    );
  }
}