import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget{
  @override
  _SearchPage createState() => _SearchPage();
  SearchPage({Key key}) : super(key: key);
}


class _SearchPage extends State<SearchPage>{
  var mKeyword = 'keyword';
  var _keywordController = TextEditingController();
  var searchWords = [];

  Future<String> get() async {
    var keyword;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    keyword = prefs.getString(mKeyword);
    return keyword;
  }

  void initState() {
    super.initState();
    
    Future<String> keyword = get();
    keyword.then((String keyword) {
      print('数据获取成功：$keyword');
      // searchWords = json.decode(keyword);
    });
  }

  @override
  Widget build(BuildContext context){
    save() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(searchWords.length == 4){
        searchWords.removeLast();
        searchWords.insert(0,_keywordController.text.toString());
      }else{
        searchWords.insert(0, _keywordController.text.toString());
      }        
      // List<String> cityList = new List<String>.from(searchWords);      
      // prefs.setStringList(mKeyword, searchWords);
      prefs.setString(mKeyword, searchWords.toString());
    }

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
          controller: _keywordController,
            autofocus: true,
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
                  save();
                  print('数据存储成功');
                  // searchWords.addAll(_controller.text);
                  // if(searchWords.length == 4){
                  //   searchWords.removeLast();
                  //   searchWords.insert(0, _controller.text);
                  // }else{
                  //   searchWords.insert(0, _controller.text);
                  // }              
                  // print(searchWords);
                },
              ),
            ),
            // keyboardType: TextInputType.phone, 
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          // RaisedButton(
          // color: Colors.blueAccent,
          // child: Text("存储"),
          // onPressed: () {
          //   save();
          //   print('数据存储成功');
          // }),
          // RaisedButton(
          //   child: Text("获取"),
          //   onPressed: (){
          //     Future<String> keyword = get();
          //       keyword.then((String keyword) {
          //         // print('sssss');
          //         print('数据获取成功：$keyword');
                  
          //       });
          //   },
          // ),
        ],
      ),
      // body: HistorySearch(searchWords: searchWords),
    );
    });
    
  }
}

class HistorySearch extends StatefulWidget {
  final List searchWords;
  @override
  _HistorySearch createState() => _HistorySearch();
  HistorySearch({Key key, @required this.searchWords}) : super(key: key);
}

class _HistorySearch extends State<HistorySearch>{
  var searchWords;
  Future getDetail() async {
    print(searchWords);
  }
  @override
  void initState() {
    super.initState();
    searchWords = widget.searchWords;
    getDetail();
  }

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left: 22, right: 20, top: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: searchWords.length,
        itemBuilder: (BuildContext context, int index){
          // return AppList(listdata: similarList[index]);
          return Text('哈哈哈ss');
        },
      )
      // child: Row(
      //   children: <Widget>[
      //     Icon(Icons.history, size: 28, color: Color.fromARGB(255, 44, 44, 44)),
      //     Container(
      //       padding: EdgeInsets.only(left: 22),
      //       child: Text('Pixel'),
      //     )
      //   ],
      // ),
    );
  }
}