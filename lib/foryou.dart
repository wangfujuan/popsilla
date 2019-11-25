import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'itemtitle.dart';
// import 'editorDetail.dart';
import 'detailpage.dart';
import 'jsonitemdata.dart';
import 'applist.dart';


class ForYouBox extends StatefulWidget {
  final int pid;
  const ForYouBox({ Key key, @required this.pid}) : super(key: key);
  @override
  _ForYouBox createState() => _ForYouBox();
}

class _ForYouBox extends State<ForYouBox>{
  int pid;
  List lastestData, popularData, newData, highlyData;
  Future getlastest() async {
    final responselatest = await http.get('http://yujie.local.com/flutter/lastest?pid=$pid');
    final responsepopular = await http.get('http://yujie.local.com/flutter/popular?pid=$pid');
    final responsenew = await http.get('http://yujie.local.com/flutter/top_apps?pid=$pid');
    final responsehighly = await http.get('http://yujie.local.com/flutter/highly?pid=2');
    if(responselatest.statusCode == 200) {
      lastestData = json.decode(responselatest.body)['list'];
      setState(() {
        lastestData = lastestData.map((json) => ListData.fromJson(json)).toList();
      });
    }
    if(responsepopular.statusCode == 200) {
      popularData = json.decode(responsepopular.body)['list'];
      setState(() {
        popularData = popularData.map((json) => ListData.fromJson(json)).toList();
      });
    }
    if(responsenew.statusCode == 200) {
      newData = json.decode(responsenew.body)['list'];
      setState(() {
        newData = newData.map((json) => ListData.fromJson(json)).toList();
      });
    }
    if(responsehighly.statusCode == 200) {
      highlyData = json.decode(responsehighly.body)['list'];
      setState(() {
        highlyData = highlyData.map((json) => ListData.fromJson(json)).toList();
      });
    }
    print('$pid');
  }

  @override
  void initState() {
    super.initState();
    pid = widget.pid;
    getlastest();
  }

  @override
  Widget build(BuildContext context){
    // final size = MediaQuery.of(context).size;
    return new Container(
      child: ListView(
        children: <Widget>[
          // ItemTitle(name: "Editor's Choice", arrowvisible: true),
          // ItemBox(),
          // ItemBox(),
          SwiperView(pid: pid),
          ItemTitle(name: pid == 1 ? "Latest Update Games" : "Latest Update Apps", arrowvisible: true),
          Container(
            height: 163,
            child: lastestData == null ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue))) : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lastestData.length,
              itemBuilder: (BuildContext context, int index){
                return AppList(listdata: lastestData[index]);
              },
            )
          ),
          ItemTitle(name: pid == 1 ? "Popular Free Games" : "Popular Free Apps", arrowvisible: true),
          Container(
            height: 163,
            child: popularData == null ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue))) : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularData.length,
              itemBuilder: (BuildContext context, int index){
                return AppList(listdata: popularData[index]);
              },
            )
          ),
          ItemTitle(name: pid == 1 ? "New Games" : "New Apps", arrowvisible: true),
          Container(
            height: 163,
            child: newData == null ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue))) : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newData.length,
              itemBuilder: (BuildContext context, int index){
                return AppList(listdata: newData[index]);
              },
            )
          ),
          ItemTitle(name: pid == 1 ? "Highly Rated Games" : "Highly Rated Apps", arrowvisible: true),
          Container(
            height: 163,
            child: highlyData == null ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue))) : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: highlyData.length,
              itemBuilder: (BuildContext context, int index){
                return AppList(listdata: highlyData[index]);
              },
            )
          ),
        ],
      ),
    );
  }
}

class SwiperView extends StatefulWidget {
  final int pid;
  @override
  _SwiperViewState createState() => _SwiperViewState();
  SwiperView({Key key, @required this.pid}) : super(key: key);
}

class _SwiperViewState extends State<SwiperView> {
  int pid;
  List appsCon = [
    {
      'title': 'Netflix-Watch TV Shows Online, Watch Movies Online',
      'id': 15
    },{
      'title': 'Face Master-Face Aging,Face Scanner',
      'id': 610
    },{
      'title': 'IN Launcher - Love Emojis & GIFs, Themes',
      'id': 116
    }
  ];
  List gamesCon = [
    {
      'title': 'Idle Miner Tycoon - Mine Manager Simulator',
      'id': 142
    },{
      'title': 'Extreme Car Driving Simulator',
      'id': 227
    },{
      'title': 'Sniper 3D Gun Shooter: Free Elite Shooting Games',
      'id': 3454
    }
  ];
  
  @override
  void initState() {
    super.initState();
    pid = widget.pid;
  }
  
  @override
  Widget build(BuildContext context) {
    List textList = (pid == 1 ? gamesCon : appsCon);
    return Container(  
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: 3,
        viewportFraction: 0.92,
        scale: 0.96,
        onTap: (index) {
          Navigator.push(context, MaterialPageRoute(builder: (context){  
            return DetailPage(id: textList[index]['id']);
          }));
        },
      )
    );
  }
  Widget _swiperBuilder(BuildContext context, int index) {
    List textList = (pid == 1 ? gamesCon : appsCon);
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 150.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/'+ (pid == 1 ? 'games' :'apps') + '/banner_$index.png')
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(120, 0, 0, 0),
              Color.fromARGB(0, 0, 0, 0)
            ]
          )
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(textList[index]['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18)),      
        ),
      ),
    );
  }
}
// class ItemBox extends StatefulWidget{
//   final editordata;
//   @override
//   _ItemBox createState() => _ItemBox();
//   ItemBox({Key key, @required this.editordata}) : super(key: key);
// }

// class _ItemBox extends State<ItemBox>{
//   var editordata;
//   @override
//   void initState() {
//     super.initState();
//     editordata = widget.editordata;
//   }
//   @override
//   Widget build(BuildContext context){
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context){  
//           return EditorDetail();
//         }));
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 20, left: 16.0),
//         child: Row(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(right: 12.0),
//               width: 150.0,
//               height: 80.0,
//               decoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 borderRadius: BorderRadius.circular(6.5),
//                 boxShadow: [BoxShadow(color: Color(0x33000000), offset: Offset(0, 2), blurRadius: 3.0)],
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage('images/banner_1.jpg')
//                 ),
//               ),
//             ),
//             Expanded(
//               child:  Column(
//                 children: <Widget>[
//                   Align(
//                     alignment: FractionalOffset.centerLeft,
//                     child: Text('editordata.title', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
//                   ),
//                   Align(
//                     alignment: FractionalOffset.centerLeft,
//                     child: Container(
//                       padding: EdgeInsets.only(top: 8.0),
//                       child: Row(
//                         children: <Widget>[
//                           Container(
//                             margin: EdgeInsets.only(right: 8.0),
//                             width: 30.0,
//                             height: 30.0,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(7),
//                               image: DecorationImage(
//                                 fit: BoxFit.fill,
//                                 image: AssetImage('images/candy-crush-saga.png')
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 8.0),
//                             width: 30.0,
//                             height: 30.0,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(4),
//                               image: DecorationImage(
//                                 fit: BoxFit.fill,
//                                 image: AssetImage('images/golf-clash.png')
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 8.0),
//                             width: 30.0,
//                             height: 30.0,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(4),
//                               image: DecorationImage(
//                                 fit: BoxFit.fill,
//                                 image: AssetImage('images/subway-surfers.png')
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 8.0),
//                             width: 30.0,
//                             height: 30.0,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(4),
//                               image: DecorationImage(
//                                 fit: BoxFit.fill,
//                                 image: AssetImage('images/golf-clash.png')
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 8.0),
//                             width: 30.0,
//                             height: 30.0,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(4),
//                               image: DecorationImage(
//                                 fit: BoxFit.fill,
//                                 image: AssetImage('images/subway-surfers.png')
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                     ),
//                   ),
//                 ],
//               ),
//             ), 
//           ],
//         ),
//       )
//     );
//   }
// }