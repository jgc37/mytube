import 'package:flutter/material.dart';
import 'subscriptions.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:html/parser.dart';

Future<getChannelInfo> getChannelsInfo(MapEntry m) async {
  String url = m.value;
  http.Response response = await http.get(url);
  xml.XmlDocument xtxt = xml.parse(response.body);
  http.Response hurl = await http.get(
      "https://www.googleapis.com/youtube/v3/channels?part=snippet&id=" +
          xtxt
              .findAllElements("yt:channelId")
              .map((node) => node.text)
              .toList()[0] +
          "&fields=items%2Fsnippet%2Fthumbnails%2Fdefault&key=AIzaSyC7T23AkwI6HFnQb2q3Q5_iVFFZl6M05So");
  var rawUrl =
      hurl.body.replaceAll("\n", " ").replaceAll(new RegExp(r"\s+\b|\b\s"), "");
  String Url = rawUrl.substring(86, rawUrl.length - 65);
  return getChannelInfo.fromxml(xtxt, Url);
}

class getChannelInfo {
  final String ChannelName;
  final String ChannelUrl;
  final String ChannelProfileUrl;

  getChannelInfo({this.ChannelName, this.ChannelUrl, this.ChannelProfileUrl});

  factory getChannelInfo.fromxml(xml.XmlDocument cXml, String jsonData) {
    return getChannelInfo(
      ChannelName:
          cXml.findAllElements("title").map((node) => node.text).toList()[0],
      ChannelUrl:
          cXml.findAllElements("uri").map((node) => node.text).toList()[0],
      ChannelProfileUrl: jsonData,
    );
  }
}
class ChannelInfo{

   static int ChannelNumber;
   String channelUrl = getValues("ChannelUrl");
   String channelProfileUrl = getValues("ChannelProfileUrl");
   String subscriberCount;

  ChannelInfo(int n){
    ChannelNumber = n;
  }

  static String getValues(String value){
    FutureBuilder(
      future: getChannelsInfo(getChannels().entries.toList()[ChannelNumber]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.data.value;
      },
    );
  }
}

class Channels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new ListView.builder(
          itemCount: getChannels().length,
          itemBuilder: (BuildContext context, int index) {
            return new ListTile(
              title: new Text(
                getChannels().keys.toList()[index],
                style: new TextStyle(color: Colors.white),
              ),
              leading: new CircleAvatar(
                      backgroundImage:
                          new NetworkImage(ChannelInfo(index).channelProfileUrl),
                    ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ChannelPage(index)));
              },
            );
          }),
    );
  }
}

class ChannelPage extends StatelessWidget {
  int pageNumber;
  ChannelPage(int p) {
    this.pageNumber = p;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: new AppBar(
        title: new Text(getChannels().keys.toList()[pageNumber]),
        backgroundColor: Colors.red[600],
      ),
      body: new Column(
        children: <Widget>[
          new Card(
            color: Colors.grey[700],
            child: new Row(
              children: <Widget>[
                new CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            new NetworkImage(ChannelInfo(pageNumber).channelProfileUrl),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
