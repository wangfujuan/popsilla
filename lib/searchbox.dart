import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'search.dart';

//搜索
class SearchBox extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    double _statusBarHeight = MediaQuery.of(context).padding.top;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){  
          return SearchPage();
        }));
      },
      child: Container(
        margin: EdgeInsets.only(top: _statusBarHeight),
        padding: EdgeInsets.only(left: 16, right: 16),
        width: MediaQuery.of(context).size.width-32,
        height: 40.0,
        decoration: new BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 246),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.search, color: Color.fromARGB(255, 142, 142, 146)),
            ),
            Container(
              child: Text('Search for apps & games', style: TextStyle(color: Color.fromARGB(255, 142, 142, 146),fontSize: 14,fontWeight: FontWeight.w500, decoration: TextDecoration.none))
            )
            
          ],
        ),
      ),
    );
     
  }
}