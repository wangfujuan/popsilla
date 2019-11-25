import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'itemtitle.dart';
import 'itembox.dart';

class SectionBox extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      padding: EdgeInsets.only(top:15, bottom: 10),
      margin: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 240, 240, 240),
            width: 0.5
          )
        )
      ),
      child: Column(
        children: <Widget>[
          ItemTitle(name: '调取', arrowvisible: true),
          ItemBox(),
          ItemBox(),
          ItemBox()
        ],
      ),
    );
  }
}