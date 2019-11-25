import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:popsilla/detailPage.dart';
// import 'package:popsilla/notFoundPage.dart';
// import 'home.dart';
import 'app.dart';
import 'game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',
      theme: ThemeData.light(),
      home: MyPage(),   
      routes: {
        '/detail': (context) => new DetailPage(id: 1)
      },
      // onUnknownRoute: (RouteSettings setting) {
      //   String name = setting.name;
      //   print("onUnknownRoute:$name");
      //   return new MaterialPageRoute(builder: (context) {
      //     return new NotFoundPage();
      //   });
      // },
    );
  }
}

class MyPage extends StatefulWidget {
  MyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
        items: [
          // BottomNavigationBarItem(
          //   icon: Icon(CupertinoIcons.home),
          //   title: Text('Home')
          // ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.collections),
            title: Text('Game')
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.game_controller),
            title: Text('App')
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              // case 0:
              //   return HomePage();
              //   break;
              case 0:
                return GamePage(pid: 1);
                break;
              case 1:
                return AppPage(pid: 2);
                break;
              default:
                return Container();
            }
          },
        );
      },
    );
  }
}