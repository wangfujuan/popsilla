// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
import 'searchbox.dart';
// import 'itemtitle.dart';
// import 'editorDetail.dart';
import 'foryou.dart';
import 'topcharts.dart';
import 'categories.dart';

class AppPage extends StatefulWidget {
  final int pid;
  @override
  _AppPage createState() => _AppPage();
  AppPage({Key key, @required this.pid}) : super(key: key);
}

class _AppPage extends State<AppPage> {
  int pid;
  @override
  void initState() {
    super.initState();
    pid = widget.pid;
  }

  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: choices.length,
      child: new Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: SearchBox(),
          backgroundColor: Colors.white,
          elevation: 0,//阴影的高度
          brightness: Brightness.light,
          bottom: PreferredSize(
            child: Container(
              decoration: new BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 220, 220, 220),
                    width: 0.5
                  )
                ),
                // color: Color.fromARGB(255, 240, 240, 246),
              ),
              margin: EdgeInsets.only(top: 0),
              width: size.width,
              height: 48.0,
              child: TabBar(
                isScrollable: true,
                labelPadding: EdgeInsets.only(left: 16, right: 16),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.blue,
                indicatorColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                tabs: choices.map((Choice choice){
                  return new Tab(
                    text: choice.title,
                  );
                }).toList(),
              ),
            ),
            preferredSize: Size(0, 34)
          ) 
        ),
        body: TabBarView(
          children: choices.map((Choice choice){
            return ChoiceCard(choice: choice);
            // return Text(choice.title);
          }).toList(),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.content});
  final String title;
  final Object content;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'For You', content: ForYouBox(pid: 2)),
  const Choice(title: 'Top Charts',content: TopChartsBox(pid: 2)),
  const Choice(title: "Categories", content: CategoryBox(pid: 2)),
  // const Choice(title: "Editor's Choice", content: EditorBox()),
];


class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice}) : super(key: key);
  final Choice choice;
  
  @override
  Widget build(BuildContext context){
    return choice.content;
  }
}

// class EditorBox extends StatelessWidget{
//   const EditorBox({ Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context){
//     return Container(
//       margin: EdgeInsets.only(top: 15),
//       child: ListView(
//         children: <Widget>[
//           ItemTitle(name: '调取', arrowvisible: true),
//           ItemBox(),
//           ItemBox(),
//           ItemBox(),
//           ItemBox(),
//           ItemBox(),
//         ],
//       ),
//     );
//   }
// }

// class ItemBox extends StatelessWidget{
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
//                     child: Text('Free Rravel Essential App', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
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