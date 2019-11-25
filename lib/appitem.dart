import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'detailPage.dart';

class AppItem extends StatefulWidget{
  final listdata;
  final int index;
  final bool catevisible;
  @override
  _AppItem createState() => _AppItem();
  AppItem({Key key, @required this.listdata, @required this.index, @required this.catevisible}) : super(key: key);
}

class _AppItem extends State<AppItem>{
  var listdata;
  int index;
  bool catevisible;
  @override
  void initState() {
    super.initState();
    listdata = widget.listdata;
    index = widget.index;
    catevisible = widget.catevisible;
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
        margin: EdgeInsets.only(top: 25),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              child: Center(
                child: Text('$index'),
              )
            ),
            Container(
              margin: EdgeInsets.only(right: 20.0),
              width: 55.0,
              height: 55.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(11),
                boxShadow: [BoxShadow(color: Color(0x33000000), offset: Offset(0, 2), blurRadius: 3.0)],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://www.myappcdn.com/logo_150/' + listdata.playlink + '.png') //网络图片
                ),
              ),
            ),
            Expanded(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(listdata.shortname.toString(), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.none, fontSize: 14, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
                  catevisible ? Container(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Text(listdata.catename.toString(), maxLines: 1, style: TextStyle(decoration: TextDecoration.none, fontSize: 12,fontWeight: FontWeight.w500, color: Color.fromARGB(255, 142, 142, 146))),
                  ) : Container(),
                  Container(
                    margin: EdgeInsets.only(top: 3.0),
                    width: 90.0,
                    child: Row(
                      children: <Widget>[
                        Text(listdata.rating.toString(), style: TextStyle(fontSize: 12)),//浮点型数据转成字符型
                        Icon(Icons.star, color: Colors.black54,size: 12,)
                      ],
                    ),
                  ) 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}