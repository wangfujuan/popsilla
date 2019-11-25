import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'appitem.dart';
import 'jsonitemdata.dart';

class TopChartsBox extends StatefulWidget{
  final int pid;
  const TopChartsBox({ Key key, @required this.pid}) : super(key: key);
  @override
  _TopChartsBox createState() => _TopChartsBox();
}

class _TopChartsBox extends State<TopChartsBox>{
  //获取top数据
  int pid;
  List topList;
  Future getTopData() async {
    final String url = 'http://yujie.local.com/flutter/popular?pid=$pid';
    final response = await http.get(url);
    if(response.statusCode == 200) {
      topList = json.decode(response.body)['list'];
      print(topList[0]);
      setState(() {
        topList = topList.map((json) => ListData.fromJson(json)).toList(); 
      });
    }
  }
  //初始化
  @override
  void initState() {
    super.initState();
    pid = widget.pid;
    getTopData();
  }

  @override
  Widget build(BuildContext context){
    return topList == null  ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue))) : 
    Container(
      // padding: EdgeInsets.only(top: 25),
      child: ListView.builder(
        itemCount: topList.length,
        itemBuilder: (BuildContext context, int index) {
          return AppItem(listdata: topList[index], index: index+1, catevisible: true);
        },
      ),
    );
  }
}