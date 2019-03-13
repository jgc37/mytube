import 'package:flutter/material.dart';
import 'package:googleapis/youtube/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:youtube_api/youtube_api.dart';

class trending extends StatefulWidget {
  @override
  trendingState createState() => new trendingState();
}

class trendingState extends State<trending> {
  static String key = 'AIzaSyC7T23AkwI6HFnQb2q3Q5_iVFFZl6M05So';
  YoutubeAPI ytApi = new YoutubeAPI(key);
  List<YT_API> Videos = [];

  refresh() async {
    Videos = await ytApi.Search("Test");
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    /*return new ListView.builder(
      itemCount: Videos.length,
      itemBuilder: (context, int index) {
        return Video(index);
      },
      */
      return new ListView(

      );
  }
/*
  Widget Video(index) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Image.network(Videos[index].thumbnail['default']['url']),
          new Row(
            children: <Widget>[
              new Text(
                Videos[index].title,
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              new Text(
                Videos[index].channelTitle
              )
            ],
          )
        ],
      ),
    );
  }
}
/*