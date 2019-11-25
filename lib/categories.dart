import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'categoryPage.dart';

class CategoryData {
  final String name;
  final String slug;
  final int id;
  
  CategoryData({
    this.name,
    this.slug,
    this.id
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      name: json['cate_name'] as String,
      slug: json['cate_slug'] as String,
      id: json['id'] as int,
    );
  }
}

class CategoryBox extends StatefulWidget{
  final int pid;
  const CategoryBox({ Key key, @required this.pid}) : super(key: key);
  @override
  _CategoryBox createState() => _CategoryBox();

}

class _CategoryBox extends State<CategoryBox>{  
  int pid;
  //获取分类数据
  List categoryList = [];
  Future getCategoryData() async {
    final String url = 'http://yujie.local.com/flutter/apps_cate?pid=$pid';
    final response = await http.get(url);
    if(response.statusCode == 200) {
      categoryList = json.decode(response.body)['list'];
      setState(() {
        categoryList = categoryList.map((json) => CategoryData.fromJson(json)).toList(); 
      });
    }
  }
  //初始化
  @override
  void initState() {
    super.initState();
    pid = widget.pid;
    getCategoryData();
  }
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 25, left: 20,right: 20),
      child: categoryList == null  ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue))) : ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index){
          return CategoryItem(categoryList[index]);
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget{
  final CategoryData categoryData;
  CategoryItem(this.categoryData);
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){  
          return CategoryPage(name: categoryData.name, id: categoryData.id);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Row(
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(right: 10),
              decoration: new BoxDecoration(
                color: Color.fromARGB(255,34, 150, 243),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(Icons.call_made, size: 16, color: Colors.white),
            ),
            Text(categoryData.name)
          ],
        ),
      ),
    );
  }
}