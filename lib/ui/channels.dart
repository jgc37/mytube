import 'package:flutter/material.dart';
import 'subscriptions.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'dart:async';

Future<ChannelInfo> getChannelsInfo(MapEntry m) async {
  String url = m.value;
  http.Response response = await http.get(url);
  xml.XmlDocument xtxt = xml.parse(response.body);
  return ChannelInfo.fromxml(xtxt);
}

class ChannelInfo {
  final String ChannelName;
  final String ChannelUrl;
  final String ChannelProfileUrl;

  ChannelInfo({this.ChannelName, this.ChannelUrl, this.ChannelProfileUrl});

  factory ChannelInfo.fromxml(xml.XmlDocument cXml) {
    return ChannelInfo(
      ChannelName:
          cXml.findAllElements("title").map((node) => node.text).toList()[0],
      ChannelUrl:
          cXml.findAllElements("uri").map((node) => node.text).toList()[0],
      ChannelProfileUrl:
          "https://www.googleapis.com/youtube/v3/channels?part=snippet&id+" +
              cXml.findAllElements("id").map((node) => node.text).toList()[0] +
              "&fields=items%2Fsnippet%2Fthumbnails&key={AIzaSyD-_BbDbEAi5HXVOMy10Q1vYcngPNmWhNE}",
    );
  }
}

class Channels extends StatelessWidget {
  final Future<ChannelInfo> channelInfo;

  Channels({Key key, this.channelInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: getChannels().length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: new Text(
            getChannels().keys.toList()[index],
            style: new TextStyle(color: Colors.white),
          ),
          leading: new CircleAvatar(
            child: new FutureBuilder(
              future: getChannelsInfo(getChannels().entries.toList()[index]),
              builder: (context, snapshot) {
                return new Image.network(snapshot.data.ChannelProfileUrl);
              },
            ),
          ),
        );
      },
    );
  }
}
