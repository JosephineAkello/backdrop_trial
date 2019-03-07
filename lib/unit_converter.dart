import 'package:flutter/material.dart';


class UnitConverter extends StatefulWidget{

_UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter>{
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