import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:flutter/cupertino.dart';
import 'subscriptions.dart';


class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
  

    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        backgroundColor: Colors.red,
        
      ),
      backgroundColor: Colors.grey[800],
      child: new CupertinoTabScaffold(
        tabBuilder: (context, index){
          if(index == 0){
            return Home();
          }else if(index == 1){
            return Subscriptions();
          }
        },
        tabBar: new CupertinoTabBar(
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.home)
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.subscriptions)
            )
          ],
        ),
      ),
    );
  }
}