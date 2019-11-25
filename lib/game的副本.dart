
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'searchbox.dart';
// import 'planebox.dart';
import 'itemtitle.dart';
// import 'ItemBoxRank.dart';

class GamePage extends StatelessWidget {
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
  const Choice(title: 'For You', content: ForYouBox()),
  const Choice(title: 'Top Charts',content: TopChartsBox()),
  const Choice(title: "Categories", content: CategoryBox()),
  const Choice(title: "Editor's Choice", content: EditorBox()),
];



class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice}) : super(key: key);
  final Choice choice;
  
  @override
  Widget build(BuildContext context){
    // print(choice.title);
    return choice.content;
    // return ForYouBox();
  }
}

class EditorBox extends StatelessWidget{
  const EditorBox({ Key key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: ListView(
        children: <Widget>[
          ItemTitle(name: '调取', arrowvisible: true),
          ItemBox(),
          ItemBox(),
          ItemBox(),
          ItemBox(),
          ItemBox(),
        ],
      ),
    );
  }
}

class CategoryBox extends StatelessWidget{
  const CategoryBox({ Key key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 15),
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
            child: Icon(Icons.assistant, size: 16, color: Colors.white),
          ),
          Text('Action')
        ],
      ),
    );
  }
}

class TopChartsBox extends StatelessWidget{
  const TopChartsBox({ Key key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Container(
                height: 28,
                margin: EdgeInsets.only(right: 15),
                padding: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(78, 149, 236, .2),
                  // border: Border.all(
                  //   color: Color.fromARGB(255, 220, 220, 220),
                  //   width: 1
                  // ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text('Top Apps', style: TextStyle(color: Colors.blue),),
                ),
              ),
              Container(
                height: 28,
                margin: EdgeInsets.only(right: 15),
                padding: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 220, 220, 220),
                    width: 1
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text('Top Games'),
                ),
              ),
              Container(
                height: 28,
                margin: EdgeInsets.only(right: 15),
                padding: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 220, 220, 220),
                    width: 1
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text('Top Paid'),
                ),
              ),
            ],
          ),
        ),
        // ItemBoxRank(),
        // ItemBoxRank(),
        // ItemBoxRank(),
        // ItemBoxRank(),
        // ItemBoxRank(),
        // ItemBoxRank(),
        // ItemBoxRank(),
        // ItemBoxRank(),
        // ItemBoxRank(),
      ],
    );
  }
}

class ForYouBox extends StatelessWidget{
  const ForYouBox({ Key key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return new Container(
      height: size.height-218,
      padding: EdgeInsets.only(top:15, bottom: 10),
      child: ListView(
        children: <Widget>[
          ItemTitle(name: '调取', arrowvisible: true),
          ItemBox(),
          ItemBox(),
          // PlaneBox(name: '调取'),
          // PlaneBox(name: '调取'),
          // PlaneBox(name: '调取'),
        ],
      ),
    );
  }
}

class ItemBox extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      margin: EdgeInsets.only(bottom: 20, left: 16.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 12.0),
            width: 150.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(6.5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/banner_1.jpg')
              ),
            ),
          ),
          Expanded(
            child:  Column(
              children: <Widget>[
                Align(
                  alignment: FractionalOffset.centerLeft,
                  child: Text('Free Rravel Essential App', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
                ),
                Align(
                  alignment: FractionalOffset.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8.0),
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/candy-crush-saga.png')
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8.0),
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/golf-clash.png')
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8.0),
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/subway-surfers.png')
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8.0),
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/golf-clash.png')
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8.0),
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/subway-surfers.png')
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                ),
              ],
            ),
          ), 
        ],
      ),
    );
  }
}
// class EditorBox extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return new  Column(
//       children: <Widget>[
//         SectionBox(),
//         SectionBox(),
//       ],
//     );
//   }
// }