import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:flutter/cupertino.dart';
import 'subscriptions.dart';
import 'trending.dart';

class Home extends StatefulWidget{
  HomeState createState() => new HomeState();
}


class HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController tcontrol;
  String title;


    setTitle(){
    if(tcontrol.index == 0){
      setState(() {
        title = "Trending";
        
      });
    }else if(tcontrol.index == 1){
      setState(() {
        title = "Subscriptions";
        
      });
    }else if(tcontrol.index == 2){
      setState(() {
        title = "Settings";
        
      });
    }
  }

  @override void initState() { 
  super.initState();
     tcontrol = new TabController(vsync: this,length: 3);
     tcontrol.addListener(setTitle);
     setTitle();
  }

  
  @override
 void dispose() {
   tcontrol.dispose();
   super.dispose();
   
 }



  
  @override
  Widget build(BuildContext context) {
    
    
    return  new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
          backgroundColor: Colors.red[600],
          bottom: new TabBar(
            controller: tcontrol,
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorPadding:EdgeInsets.fromLTRB(50, 0, 50, 0) ,
            labelPadding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.whatshot),
              ),
              new Tab(
                icon: new Icon(Icons.subscriptions),
              ),
              new Tab(
                icon: new Icon(Icons.settings), 
              )
            ],
          ),
        ),
        body: new TabBarView(
          controller:  tcontrol,
          children: <Widget>[
            new trending(),
            new Tab(
              child: new Center(
                child: new Text("Subscriptions"),
              ),
            ),
            new Tab(
              child: new Center(
                child: new Text("Settings"),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[800],
      );
  }
}

