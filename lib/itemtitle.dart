import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ItemTitle extends StatefulWidget {
  final String name;
  final bool arrowvisible;
  @override
  _ItemTitle createState() => _ItemTitle();
  ItemTitle({Key key, @required this.name, @required this.arrowvisible}) : super(key: key);
}

class _ItemTitle extends State<ItemTitle>{
  String name;
  bool arrowvisible;
  
  @override
  void initState() {
    super.initState();
    name = widget.name;
    arrowvisible = widget.arrowvisible;
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      margin: EdgeInsets.only(bottom: 15.0, right: 16.0, left: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('$name', textAlign: TextAlign.left, style: TextStyle(decoration: TextDecoration.none, fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromRGBO(0, 0, 0, 1))),
          ),
          Container(
            // width: 20.0,
            // height: 20.0,
            // decoration: BoxDecoration(
            //   shape: BoxShape.rectangle,
            //   borderRadius: BorderRadius.circular(20.0),
            //   color: Color.fromARGB(255, 240, 240, 246)
            // ),
            child: arrowvisible ? Icon(Icons.arrow_forward, size: 22, color: Colors.black54,) : Container()
          ),
            // child: Text("More >", textAlign: TextAlign.right, style: TextStyle(decoration: TextDecoration.none, fontSize: 12, color: Color.fromRGBO(0, 0, 0, 1), fontWeight: FontWeight.w400)),
        ]
      )
    );
  }
}