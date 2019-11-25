import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Storage{
  static Future<void> setString(key,value) async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString(key, value);
  }
  static Future<String> getString(key) async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    return sp.getString(key);
  }
  static Future<String> remove(key) async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.remove(key);
    return 'success';
  }
}

class SearchServices {
  static setHistoryData(keywords) async {
    /**
     * 1.获取本地存储里面的数据。(searchList)
     * 2.判断本地存储是否有数据
     * 2.1如果有数据：
     *  1.读取本地存储的数据。
     * 2.判断本地存储中有没有当前数据；
     * 3.如果有不做操作
     * 如果没有当前数据，本地存储的数据和当前数据拼接后重新写入。
     * 2.2如果没有数据：
     * 直接把当前数据放在数组中写入到本地存储。
     * 
     * 
     *  */
    try {
      List searchListData = json.decode(await Storage.getString('searchList'));
      var hasData = searchListData.any((v) {
        return v == keywords;
      });
      if (!hasData) {
        searchListData.add(keywords);
        await Storage.setString('searchList', json.encode(searchListData));
      }
    } catch (e) {
      List tempList = new List(); 
      tempList.add(keywords);
      await Storage.setString('searchList', json.encode(tempList));
    }
  }

  static getHistoryList() async {
    try {
      List searchListData = json.decode(await Storage.getString('searchList'));
      return searchListData;
    } catch (e) {
      return [];
    }
  }

  static removeHistoryList() async {
    await Storage.remove('searchList');
  }
}



class SearchPage extends StatefulWidget{
  @override
  _SearchPage createState() => _SearchPage();
  SearchPage({Key key}) : super(key: key);
}


class _SearchPage extends State<SearchPage>{
  // var _keywordController = TextEditingController();
  var keywords;
  List historyListData = [];

  void initState() {
    super.initState();
    this.historyListWidget();
    this.getHistoryData();
  }
  getHistoryData() async {
    var historyListData = await SearchServices.getHistoryList();
    print(historyListData);
    setState(() {
     this.historyListData = historyListData; 
    });
  }

  Widget historyListWidget() {
    if (historyListData.length > 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: this.historyListData.map((value) {
              return Container(
                padding: EdgeInsets.only(left: 22, right: 20, top: 20),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.history, size: 28, color: Color.fromARGB(255, 44, 44, 44)),
                    Container(
                      padding: EdgeInsets.only(left: 22),
                      child: Text('$value'),
                    )
                  ],
                )
              );
            }).toList(),
          ),
        ],
      );
    } else {
      return Text('');
    }
  }

  @override
  Widget build(BuildContext context){
    return new Builder(builder: (BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 1,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Container(
          padding: EdgeInsets.only(top: 5),
          child: TextField(
            // controller: _keywordController,
            autofocus: true,
            onChanged: (value) {
              this.keywords = value;
            },
            decoration: new InputDecoration(
              hintText: 'Search for apps & games',
              labelStyle: new TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 93, 93, 93)),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: new Icon(
                  Icons.search,
                  color: Colors.black, 
                ),
                onPressed: () {
                  SearchServices.setHistoryData(this.keywords);
                },
              ),
            ),
            // keyboardType: TextInputType.phone, 
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              SearchServices.removeHistoryList();
              this.getHistoryData();
            },
            child: Container(
              
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Icon(Icons.delete), Text('清空历史记录')],
              ),
            ),
          ),
          historyListWidget()
        ],
      ),
      // body: HistorySearch(searchWords: searchWords),
    );
    });
    
  }
}