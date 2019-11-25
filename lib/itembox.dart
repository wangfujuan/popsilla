import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class ItemBox extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(6.5),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/candy-crush-saga.png')
              ),
            ),
          ),
          Expanded(
            child:  Column(
              children: <Widget>[
                Align(
                  alignment: FractionalOffset.centerLeft,
                  child: Text('Candy Crush Saga', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.none, fontSize: 14, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
                ),
                Align(
                  alignment: FractionalOffset.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Text('Casual', maxLines: 1, style: TextStyle(decoration: TextDecoration.none, fontSize: 12,fontWeight: FontWeight.w500, color: Color.fromARGB(255, 142, 142, 146))),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            width: 80.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), 
              color: Color.fromARGB(255, 240, 240, 247),
            ),
            child: Center(
              child: Text('Download', style: TextStyle(fontSize: 12, decoration: TextDecoration.none, color: Color.fromRGBO(0, 122, 255, 1), fontWeight: FontWeight.w500)),
            )
          )
        ],
      ),
    );
  }
}