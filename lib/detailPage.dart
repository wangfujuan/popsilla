import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_html_view/flutter_html_view.dart';
import 'itemtitle.dart';
import 'applist.dart';
import 'jsonitemdata.dart';

class DetailPage extends StatefulWidget {
  final int id;
  @override
  _DetailPage createState() => _DetailPage();
  DetailPage({Key key, @required this.id}) : super(key: key);
}

class _DetailPage extends State<DetailPage> {
  int id;
  var getListData;
  List similarList;
  Future getDetail() async {
    print('$id');
    final response = await http.get('http://yujie.local.com/flutter/app_detail?id=$id');
    if(response.statusCode == 200) {
      getListData = json.decode(response.body)['list'];
      similarList = json.decode(response.body)['list']['similar'];
      print(similarList);
      setState(() {
        getListData = json.decode(response.body)['list'];
        similarList = similarList.map((json) => ListData.fromJson(json)).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    id = widget.id;
    getDetail();
  }

  @override
  Widget build(BuildContext context){
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: getListData == null
        ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue)))
        : ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16.0),
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [BoxShadow(color: Color(0x33000000), offset: Offset(0, 2), blurRadius: 3.0)],
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage('https://www.myappcdn.com/logo_150/' + getListData['play_link'] + '.png')
                      ),
                    ),
                  ),
                  Expanded(
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(getListData['short_name'], maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.none, fontSize: 22, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
                        Container(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Text(getListData['cate_name'], maxLines: 1, style: TextStyle(decoration: TextDecoration.none, fontSize: 12,fontWeight: FontWeight.w500, color: Color.fromARGB(255, 142, 142, 146)))
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16,left: 16, right: 16),
              // width: size.width,
              height: 44,
              child: Center(
                child: Text('Install', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5), 
              ),
            ), 
            Container(
              margin: EdgeInsets.only(top: 16,bottom: 30),
              height: 258,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16, bottom: 8),
                scrollDirection: Axis.horizontal,
                itemCount: getListData['screenshoot'],
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    width: 140,
                    height: 250,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [BoxShadow(color: Color(0x33000000), offset: Offset(0, 2), blurRadius: 3.0)],
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage('https://www.myappcdn.com/screenshot/'+getListData['id'].toString()+'/en_'+ index.toString() +'.png')
                      ),
                    ),
                  );
                },
              ),
            ),
            ItemTitle(name: 'Description of Roblox', arrowvisible: false),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16,bottom: 30),
              child: Text(getListData['play_info'], style: TextStyle(height: 1.4),),
              // child: HtmlView(
              //   data: '000'
              // ),
            ),
            ItemTitle(name: 'Similar to This App', arrowvisible: false),
            Container(
              height: 163,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: similarList.length,
                itemBuilder: (BuildContext context, int index){
                  return AppList(listdata: similarList[index]);
                },
              )
            )
          ],
        ),
      ),
    );
  }
}

