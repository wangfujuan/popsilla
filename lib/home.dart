import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'sectionbox.dart';
import 'searchbox.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255), 
      ),
      child: Column(
        children: <Widget>[
          SearchBox(),
          SwiperView(),
          EditorBox(),
          // TopBox()
        ],
      )
    );
  }
}

//搜索
// class SearchBox extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     double _statusBarHeight = MediaQuery.of(context).padding.top;
//     return new Container(
//       margin: EdgeInsets.only(top: _statusBarHeight),
//       padding: EdgeInsets.only(left: 16, right: 16),
//       width: MediaQuery.of(context).size.width-32,
//       height: 40.0,
//       decoration: new BoxDecoration(
//         color: Color.fromARGB(255, 240, 240, 246),
//         borderRadius: BorderRadius.circular(5.0),
//       ),
//       child: Row(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(right: 12),
//             child: Icon(Icons.search, color: Color.fromARGB(255, 142, 142, 146)),
//           ),
//           Container(
//             child: Text('Find any apps', style: TextStyle(color: Color.fromARGB(255, 142, 142, 146),fontSize: 14,fontWeight: FontWeight.w500, decoration: TextDecoration.none))
//           )
          
//         ],
//       ),
//     );
//   }
// }

class SwiperView extends StatefulWidget {
  @override
  _SwiperViewState createState() => _SwiperViewState();
}

class _SwiperViewState extends State<SwiperView> {
  @override
  Widget build(BuildContext context) {
    return Container(  
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: 10,
        viewportFraction: 0.92,
        scale: 0.96,
      )
    );
  }
  Widget _swiperBuilder(BuildContext context, int index) {
    return Container(
      height: 120.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/banner_1.jpg')
        ),
      ),
    );
  }
}

//首页列表
class EditorBox extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new  Column(
      children: <Widget>[
        SectionBox(),
        SectionBox(),
      ],
    );
  }
}

// class SectionBox extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return new Container(
//       padding: EdgeInsets.only(top:20, bottom: 10),
//       margin: EdgeInsets.only(left: 16, right: 16),
//       decoration: BoxDecoration(
//         border: Border(
//           bottom: BorderSide(
//             color: Color.fromARGB(255, 240, 240, 240),
//             width: 0.5
//           )
//         )
//       ),
//       child: Column(
//         children: <Widget>[
//           ItemTitle(),
//           ItemBox(),
//           ItemBox(),
//           ItemBox()
//         ],
//       ),
//     );
//   }
// }

// class ItemTitle extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return new Container(
//       margin: EdgeInsets.only(bottom: 20.0),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Text("Editor's Choice", textAlign: TextAlign.left, style: TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color.fromRGBO(0, 0, 0, 1))),
//           ),
//           Container(
//             width: 15.0,
//             height: 15.0,
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(15.0),
//               color: Color.fromARGB(255, 240, 240, 246)
//             ),
//             child: Icon(CupertinoIcons.right_chevron, size: 12, color: Color.fromARGB(255, 159, 159, 159),),
//           ),
//             // child: Text("More >", textAlign: TextAlign.right, style: TextStyle(decoration: TextDecoration.none, fontSize: 12, color: Color.fromRGBO(0, 0, 0, 1), fontWeight: FontWeight.w400)),
//         ]
//       )
//     );
//   }
// }

// class ItemBox extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return new Container(
//       margin: EdgeInsets.only(bottom: 15),
//       child: Row(
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.only(right: 10.0),
//             width: 55.0,
//             height: 55.0,
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(6.5),
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: AssetImage('images/candy-crush-saga.png')
//               ),
//             ),
//           ),
//           Expanded(
//             child:  Column(
//               children: <Widget>[
//                 Align(
//                   alignment: FractionalOffset.centerLeft,
//                   child: Text('Candy Crush Saga', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.none, fontSize: 14, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
//                 ),
//                 Align(
//                   alignment: FractionalOffset.centerLeft,
//                   child: Container(
//                     padding: EdgeInsets.only(top: 2.0),
//                     child: Text('Casual', maxLines: 1, style: TextStyle(decoration: TextDecoration.none, fontSize: 12,fontWeight: FontWeight.w500, color: Color.fromARGB(255, 142, 142, 146))),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 8),
//             width: 80.0,
//             height: 24.0,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20), 
//               color: Color.fromARGB(255, 240, 240, 247),
//             ),
//             child: Center(
//               child: Text('Download', style: TextStyle(fontSize: 12, decoration: TextDecoration.none, color: Color.fromRGBO(0, 122, 255, 1), fontWeight: FontWeight.w500)),
//             )
//           )
//         ],
//       ),
//     );
//   }
// }

class TopBox extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      padding: EdgeInsets.only(top:20, bottom:20),
      margin: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 240, 240, 240),
            width: 0.5
          )
        )
        // border: Border.all(color: Color(0xFFFF0000), width: 0.5)
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text("Editor's Choice", textAlign: TextAlign.left, style: TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color.fromRGBO(0, 0, 0, 1))),
                ),
                Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color.fromARGB(255, 240, 240, 246)
                  ),
                  child: Icon(CupertinoIcons.right_chevron, size: 12, color: Color.fromARGB(255, 159, 159, 159),),
                ),
                  // child: Text("More >", textAlign: TextAlign.right, style: TextStyle(decoration: TextDecoration.none, fontSize: 12, color: Color.fromRGBO(0, 0, 0, 1), fontWeight: FontWeight.w400)),
              ]
            )
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 6.0),
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(7.5),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/the-sims-freeplay.png')
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 240, 240, 240),
                        width: 0.5
                      )
                    )
                  ),
                  child: Column(
                    children: <Widget>[
                      Text('The Sims FreePlay', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.none, fontSize: 13, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
                      Text('Simulation', maxLines: 1, style: TextStyle(decoration: TextDecoration.none, fontSize: 12,fontWeight: FontWeight.w500, color: Color.fromARGB(255, 142, 142, 146))),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                width: 80.0,
                height: 24.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), 
                  color: Color.fromARGB(255, 240, 240, 247),
                ),
                child: Center(
                  child: Text('Download', style: TextStyle(fontSize: 12, decoration: TextDecoration.none, color: Color.fromRGBO(0, 122, 255, 1), fontWeight: FontWeight.w500)),
                )
              )
            ],
          )
        ],
      )
    );
  }
}


// Expanded(
//   child: Column(
//     children: <Widget>[
//       Container(
//         margin: EdgeInsets.only(bottom: 6.0),
//         width: 60.0,
//         height: 60.0,
//         decoration: BoxDecoration(
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(6.5),
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: AssetImage('images/candy-crush-saga.png')
//           ),
//         ),
//       ),
//       Text('Candy Crush Saga', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.none, fontSize: 12, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
//       Text('Casual', maxLines: 1, style: TextStyle(decoration: TextDecoration.none, fontSize: 12,fontWeight: FontWeight.w500, color: Color.fromARGB(255, 142, 142, 146))),
//       Container(
//         margin: EdgeInsets.only(top: 8),
//         width: 80.0,
//         height: 24.0,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20), 
//           color: Color.fromARGB(255, 240, 240, 247),
//         ),
//         child: Center(
//           child: Text('Download', style: TextStyle(fontSize: 12, decoration: TextDecoration.none, color: Color.fromRGBO(0, 122, 255, 1), fontWeight: FontWeight.w500)),
//         )
//       )
//     ],
//   )
// ),