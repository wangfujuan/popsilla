import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'detailPage.dart';

class AppList extends StatefulWidget{
  final listdata;
  @override
  _AppList createState() => _AppList();
  AppList({Key key, @required this.listdata}) : super(key: key);
}

class _AppList extends State<AppList>{
  var listdata;
  @override
  void initState() {
    super.initState();
    listdata = widget.listdata;
  }
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){  
          return DetailPage(id: listdata.id);
        }));
      },
      child: Container(
        margin: EdgeInsets.only(left: 16),
        child: Column(
          children: <Widget>[   
            Container(
              margin: EdgeInsets.only(bottom: 6.0),
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [BoxShadow(color: Color(0x33000000), offset: Offset(0, 2), blurRadius: 3.0)],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://www.myappcdn.com/logo_150/' + listdata.playlink + '.png')
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3.0),
              width: 90.0,
              child: Text(listdata.shortname, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.none, fontSize: 12, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
            ),
            Container(
              margin: EdgeInsets.only(top: 3.0),
              width: 90.0,
              child: Row(
                children: <Widget>[
                  Text(listdata.rating.toString(), style: TextStyle(fontSize: 12)),
                  Icon(Icons.star, color: Colors.black54,size: 12,)
                  // Icon(Icon)
                  // Image.asset('images/candy-crush-saga.png')
                ],
              ),
              // child: Text('4.8', style: TextStyle(fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }
}