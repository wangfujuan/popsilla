import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'detailPage.dart';

class EditorDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: EditorDetailBox(),
    );
  }
}

class EditorDetailBox extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 16.0),
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [BoxShadow(color: Color(0x33000000), offset: Offset(0, 2), blurRadius: 3.0)],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/candy-crush-saga.png')
                    ),
                  ),
                ),
                Expanded(
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Candy Crush Saga Candy Crush Saga', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.none, fontSize: 16, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
                      Container(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Text('Casual', maxLines: 1, style: TextStyle(decoration: TextDecoration.none, fontSize: 12,fontWeight: FontWeight.w500, color: Color.fromARGB(255, 142, 142, 146)))
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3.0),
                        // width: 90.0,
                        child: Row(
                          children: <Widget>[
                            Text('4.8', style: TextStyle(fontSize: 12)),
                            Icon(Icons.star, color: Colors.black54,size: 14,),
                            Text('(10,793', style: TextStyle(fontSize: 12)),
                            Icon(Icons.person, color: Colors.black54,size: 14,),
                            Text(') 500 thousand', style: TextStyle(fontSize: 12)),
                            Icon(Icons.file_download, color: Colors.black54,size: 14,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Why we love this', style: TextStyle(fontWeight: FontWeight.w600),),
                Container(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), 
                          color: Colors.black54,
                        ),
                        child: Center(
                          child: Text('1', style: TextStyle(fontSize: 12, decoration: TextDecoration.none, color: Colors.white, fontWeight: FontWeight.w500)),
                        )
                      ),
                      Expanded(
                        child: Text('Download the core GMS packages that we provide above.'),
                      ) 
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), 
                          color: Colors.black54,
                        ),
                        child: Center(
                          child: Text('2', style: TextStyle(fontSize: 12, decoration: TextDecoration.none, color: Colors.white, fontWeight: FontWeight.w500)),
                        )
                      ),
                      Expanded(
                        child: Text('Copy the APK file to your mobile (or download it on your phone).'),
                      ) 
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), 
                          color: Colors.black54,
                        ),
                        child: Center(
                          child: Text('3', style: TextStyle(fontSize: 12, decoration: TextDecoration.none, color: Colors.white, fontWeight: FontWeight.w500)),
                        )
                      ),
                      Expanded(
                        child: Text('Install the APK. If you meet problems, read the "Questions & Answers" below.'),
                      ) 
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), 
                          color: Colors.black54,
                        ),
                        child: Center(
                          child: Text('4', style: TextStyle(fontSize: 12, decoration: TextDecoration.none, color: Colors.white, fontWeight: FontWeight.w500)),
                        )
                      ),
                      Expanded(
                        child: Text('Google Play Store and Google Service will be automatically installed together. If you have already installed these two apps, GMS installer will ask you to uninstall them first.'),
                      ) 
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            height: 258,
            child: ListView(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 140,
                  height: 250,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [BoxShadow(color: Color(0x33000000), offset: Offset(0, 2), blurRadius: 3.0)],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/de_0.png')
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  height: 250,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [BoxShadow(color: Color(0x33000000), offset: Offset(0, 2), blurRadius: 3.0)],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/de_0.png')
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  height: 250,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [BoxShadow(color: Color(0x33000000), offset: Offset(0, 2), blurRadius: 3.0)],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/de_0.png')
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  height: 250,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [BoxShadow(color: Color(0x33000000), offset: Offset(0, 2), blurRadius: 3.0)],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/de_0.png')
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    // Navigator.of(context).pushNamed('/detail');
                    Navigator.push(context, MaterialPageRoute(builder: (context){  
                      return DetailPage(id: 1);
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 8),
                    width: size.width/2-24,
                    height: 44,
                    child: Center(
                      child: Text('MORE INFO', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
                    ),
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      border: Border.all(width: 1.0, color: Colors.blue),
                      borderRadius: BorderRadius.circular(5), 
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8, right: 16),
                  width: size.width/2-24,
                  height: 44,
                  child: Center(
                    child: Text('INSTALL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5), 
                  ),
                ),
              ],
            ),
          )
        ]
      )
    );
  }
}