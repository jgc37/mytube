import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:googleapis/youtube/v3.dart';
import 'dart:async';

import 'package:xml/xml.dart' as xml;




class  Subscriptions extends StatefulWidget {

  subscriptionsState createState() => new subscriptionsState();
}

class subscriptionsState extends State<Subscriptions> {

static var subscriptions = r'''<opml version="1.1">
<body><outline text="YouTube Subscriptions" title="YouTube Subscriptions"><outline text="Luke Smith" title="Luke Smith" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" /><outline text="diamond" title="diamond" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCEFb9iem3gudPMf_R9TSoTA" /><outline text="Logic - Topic" title="Logic - Topic" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCKC7Xqy0UXT370RvFR2kXYg" /><outline text="LogicVEVO" title="LogicVEVO" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCxGRSwwWDtOjXUn0xcNJmjg" /><outline text="Eric Reprid" title="Eric Reprid" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCYugqcud2SwC5pKj78p4DVA" /><outline text="TheOdd2sOut" title="TheOdd2sOut" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UC0GLNhtTu7yI8rl6ZZGeezw" /><outline text="ImDontai" title="ImDontai" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UC1YZ751mYZkTNFXjGXTklsQ" /><outline text="Kusorare" title="Kusorare" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCnlD9efHPJCPGmrqp9N4ByQ" /><outline text="LemonOVA" title="LemonOVA" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCKM7fGtxrLnh-GmGGhpEB3g" /><outline text="Mark Rober" title="Mark Rober" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCY1kMZp36IQSyNx_9h4mpCg" /><outline text="Dat" title="Dat" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCeowKw15_XY0YcLz0thrK2Q" /><outline text="Tyler, The Creator" title="Tyler, The Creator" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCsQBsZJltmLzlsJNG7HevBg" /><outline text="Lyrical Lemonade" title="Lyrical Lemonade" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCtylTUUVIGY_i5afsQYeBZA" /><outline text="MemerMan" title="MemerMan" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCOjc2LTXq55J0HNUMvNhvYw" /><outline text="Freememeskids" title="Freememeskids" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCM6yPd-dzKvHhGptvrAmT5w" /><outline text="Jubilee" title="Jubilee" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCJjSDX-jUChzOEyok9XYRJQ" /><outline text="InspiringPhilosophy" title="InspiringPhilosophy" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UC5qDet6sa6rODi7t6wfpg8g" /><outline text="Windows Central" title="Windows Central" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCDMnCGlkv4gyFGZo_ZT3atg" /><outline text="MuchDank" title="MuchDank" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCNVWhn89PKXM-8VMgVLSobg" /><outline text="Sam O'Nella Academy" title="Sam O'Nella Academy" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UC1DTYW241WD64ah5BFWn4JA" /><outline text="Yung Gravy" title="Yung Gravy" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCLQPinZNWKlLBF7C_m2YP3g" /><outline text="Tailosive Music" title="Tailosive Music" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCjeSnqCxZMPxdww614Yc62g" /><outline text="91Tech" title="91Tech" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UC4xZF3xguQCG76hZVUivoXw" /><outline text="nerdloser" title="nerdloser" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCd9E7NKwtE3gxzhZOEWsudw" /><outline text="SootHouse" title="SootHouse" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCU4dU07ZfRopBQroeYdpWIA" /><outline text="Ascension Presents" title="Ascension Presents" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCVdGX3N-WIJ5nUvklBTNhAw" /><outline text="Derek Banas" title="Derek Banas" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCwRXb5dUK4cvsHbx-rGzSgw" /><outline text="David Dobrik" title="David Dobrik" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCmh5gdwCx6lN7gEC20leNVA" /><outline text="EverythingApplePro" title="EverythingApplePro" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCj34AOIMl_k1fF7hcBkD_dw" /><outline text="Snazzy Labs" title="Snazzy Labs" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCO2x-p9gg9TLKneXlibGR7w" /><outline text="Jonathan Morrison" title="Jonathan Morrison" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCDlQwv99CovKafGvxyaiNDA" /><outline text="JerryRigEverything" title="JerryRigEverything" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCWFKCr40YwOZQx8FHU_ZqqQ" /><outline text="Linus Tech Tips" title="Linus Tech Tips" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCXuqSBlHAE6Xw-yeJA0Tunw" /><outline text="LandOfWhispers" title="LandOfWhispers" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UC0CmIQ_ngiRE7Ts5nfOrYjg" /><outline text="Pyrocynical" title="Pyrocynical" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCN5xN8gIljvWYnsj06V8WbQ" /><outline text="RubyHoneyBunny" title="RubyHoneyBunny" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCd2PDGvpi7hsPtwVlENv_fQ" /><outline text="laoshu505000" title="laoshu505000" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCbRaUB7Hfe3clmKqqj8Nm1Q" /><outline text="Mr. Beat" title="Mr. Beat" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCmYesELO6axBrCuSpf7S9DQ" /><outline text="Myziam YT" title="Myziam YT" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCUffHHjWeWB1L6ggoOlzbiQ" /><outline text="Vox" title="Vox" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCLXo7UDZvByw2ixzpQCufnA" /><outline text="dimidofc" title="dimidofc" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCLrWO-9syxUSLl3e4P6H0zg" /><outline text="Thomas Frank" title="Thomas Frank" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCG-KntY7aVnIGXYEBQvmBAQ" /><outline text="CallMeCarson" title="CallMeCarson" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCQMjMW-9PhWoH6TWwmnVWvA" /><outline text="apandah" title="apandah" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCVQ9S8LoggEepxMYDiRpeeg" /><outline text="Ally Law" title="Ally Law" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCagHkTCCSbohFMJln7JYqMQ" /><outline text="TechAltar" title="TechAltar" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCtZO3K2p8mqFwiKWb9k7fXA" /><outline text="gotbletu" title="gotbletu" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCkf4VIqu3Acnfzuk3kRIFwA" /><outline text="tripcode!Q/7" title="tripcode!Q/7" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCZrrEuHiQjN2CUo84g5tk7w" /><outline text="PewDiePie" title="PewDiePie" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UC-lHJZR3Gqxm24_Vd_AJ5Yw" /><outline text="Birdman" title="Birdman" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCI9f0Yq6Om7Q8HWZdncJ2Ng" /><outline text="Logic" title="Logic" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCoDcFZ5KZ0KwBC_omalJuiA" /><outline text="Visionary Music Group" title="Visionary Music Group" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCYtWSZWHYPbmwsh2CEUyMrQ" /><outline text="The Science Elf" title="The Science Elf" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCCrnCItH17W-64FDzjwOi5w" /><outline text="Nintendo" title="Nintendo" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCGIY_O-8vW4rfX98KlMkvRg" /><outline text="Marques Brownlee" title="Marques Brownlee" type="rss" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=UCBJycsmduvYEL83R_U4JriQ" /></outline></body></opml>''';
  
  var sml = xml.parse(subscriptions);
    @override 
    void initState() { 
      super.initState();

      var xchannels = sml.findAllElements("outline");
      var schannels = xchannels.toList();
      schannels.removeAt(0);
      
      Map channels = new Map();

      for (var i = 0; i < schannels.length; i++) {
         channels.addEntries({new MapEntry(schannels[i].getAttribute("title"), schannels[i].getAttribute("xmlUrl"))});

      }
      debugPrint(channels.toString());

    }
  @override

  
  Widget build(BuildContext context) {
    

    return new ListView.builder(
      itemBuilder: (context,index){

      },
    );
  }
  
}