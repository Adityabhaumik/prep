import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final  title;
  MyHomePage({@required this.title}) ;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Video Player"),
        ),

        body:  AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer.network(
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
            betterPlayerConfiguration: BetterPlayerConfiguration(
              aspectRatio: 16 / 9,
            ),
          ),
        ),
    );
  }

}


