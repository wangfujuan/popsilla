import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'appitem.dart';
import 'jsonitemdata.dart';

class CategoryPage extends StatefulWidget {
  final String name;
  final int id;
  @override
  _CategoryPage createState() => _CategoryPage();
  CategoryPage({Key key, @required this.name, @required this.id}) : super(key: key);
  
}

class _CategoryPage extends State<CategoryPage>{  
  String name;
  int id;
  int pid;
  int page = 1;
  List appList = [];
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;
  Future getList() async {
    final response = await http.get('http://yujie.local.com/flutter/category_info?id=$id&page=$page');
    // print('http://yujie.local.com/flutter/category_info?id=$id&page=$page');
    if(response.statusCode == 200) {
      final newAppList = json.decode(response.body)['list'];
      setState(() {
        appList.addAll(newAppList.map((json) => ListData.fromJson(json)).toList()); //数据追加到appList
        page ++ ;
        isPerformingRequest=false;
      });
    }
  }

  Future _refresh() async {
    appList.clear();
    print('刷新');
    page = 1;
    await getList();
    return;
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8),
      child: new Center(
        child: new CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue))
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    name = widget.name;
    id = widget.id;
    getList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
        print("loadMore");
        getList();
      }
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.5,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text('$name', style: TextStyle(color: Colors.black, fontSize: 18)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: RefreshIndicator(
          backgroundColor: Colors.blue,
          color: Colors.white,
          onRefresh: _refresh,
          child: appList.length == 0
          ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue)))
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: ListView.builder(
                itemCount: appList.length,
                itemBuilder: (BuildContext context, int index) {
                  if(index == appList.length-1){
                    return _buildProgressIndicator();
                  }else{
                    return AppItem(listdata: appList[index], index: index+1, catevisible: false);
                  }          
                },
                controller: _scrollController,
              ),
            ),
        ),
      ), 
    );
  }
}