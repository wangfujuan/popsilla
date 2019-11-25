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

class GamePage extends StatefulWidget {
  final int pid;
  @override
  _GamePage createState() => _GamePage();
  GamePage({Key key, @required this.pid}) : super(key: key);
}

class _GamePage extends State<GamePage> {
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
  const Choice(title: 'For You', content: ForYouBox(pid: 1)),
  const Choice(title: 'Top Charts',content: TopChartsBox(pid: 1)),
  const Choice(title: "Categories", content: CategoryBox(pid: 1)),
  // const Choice(title: "Editor's Choice", content: EditorBox(pid: 2)),
];


class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice}) : super(key: key);
  final Choice choice;
  
  @override
  Widget build(BuildContext context){
    return choice.content;
  }
}