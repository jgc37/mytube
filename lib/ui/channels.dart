import 'package:flutter/material.dart';
import 'subscriptions.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:html/parser.dart';

Future<ChannelInfo> getChannelsInfo(MapEntry m) async {
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
  return ChannelInfo.fromxml(xtxt, Url);
}

class ChannelInfo {
  final String ChannelName;
  final String ChannelUrl;
  final String ChannelProfileUrl;

  ChannelInfo({this.ChannelName, this.ChannelUrl, this.ChannelProfileUrl});

  factory ChannelInfo.fromxml(xml.XmlDocument cXml, String jsonData) {
    return ChannelInfo(
      ChannelName:
          cXml.findAllElements("title").map((node) => node.text).toList()[0],
      ChannelUrl:
          cXml.findAllElements("uri").map((node) => node.text).toList()[0],
      ChannelProfileUrl: jsonData,
    );
  }
}

class Channels extends StatelessWidget {
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
          leading: FutureBuilder(
            future: getChannelsInfo(getChannels().entries.toList()[index]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new CircleAvatar(
                  backgroundImage:
                      new NetworkImage(snapshot.data.ChannelProfileUrl),
                );
              } else {
                return new CircularProgressIndicator();
              }
            },
          ),
        );
      },
    );
  }
}
