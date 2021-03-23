// import 'package:flutter/material.dart';
// import 'package:better_player/better_player.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         primarySwatch: Colors.blue,
//
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//
//   final  title;
//   MyHomePage({@required this.title}) ;
//
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Video Player"),
//         ),
//
//         body:  AspectRatio(
//           aspectRatio: 16 / 9,
//           child: BetterPlayer.network(
//             "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
//             betterPlayerConfiguration: BetterPlayerConfiguration(
//               aspectRatio: 16 / 9,
//             ),
//           ),
//         ),
//     );
//   }
//
// }
//
//
// import 'package:chewie/chewie.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// void main() {
//   runApp(
//     const ChewieDemo(),
//   );
// }
//
// class ChewieDemo extends StatefulWidget {
//   // ignore: use_key_in_widget_constructors
//   const ChewieDemo({this.title = 'Chewie Demo'});
//
//   final String title;
//
//   @override
//   State<StatefulWidget> createState() {
//     return _ChewieDemoState();
//   }
// }
//
// class _ChewieDemoState extends State<ChewieDemo> {
//   TargetPlatform? _platform;
//   late VideoPlayerController _videoPlayerController1;
//   late VideoPlayerController _videoPlayerController2;
//   ChewieController? _chewieController;
//
//   @override
//   void initState() {
//     super.initState();
//     initializePlayer();
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController1.dispose();
//     _videoPlayerController2.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }
//
//   Future<void> initializePlayer() async {
//     _videoPlayerController1 = VideoPlayerController.network(
//         'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4');
//     _videoPlayerController2 = VideoPlayerController.network(
//         'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4');
//     await Future.wait([
//       _videoPlayerController1.initialize(),
//       _videoPlayerController2.initialize()
//     ]);
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController1,
//       autoPlay: true,
//       looping: true,
//       // Try playing around with some of these other options:
//
//       // showControls: false,
//       // materialProgressColors: ChewieProgressColors(
//       //   playedColor: Colors.red,
//       //   handleColor: Colors.blue,
//       //   backgroundColor: Colors.grey,
//       //   bufferedColor: Colors.lightGreen,
//       // ),
//       // placeholder: Container(
//       //   color: Colors.grey,
//       // ),
//       // autoInitialize: true,
//     );
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: widget.title,
//       theme: ThemeData.light().copyWith(
//         platform: _platform ?? Theme.of(context).platform,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: _chewieController != null &&
//                     _chewieController!
//                         .videoPlayerController.value.isInitialized
//                     ? Chewie(
//                   controller: _chewieController!,
//                 )
//                     : Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     CircularProgressIndicator(),
//                     SizedBox(height: 20),
//                     Text('Loading'),
//                   ],
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 _chewieController!.enterFullScreen();
//               },
//               child: const Text('Fullscreen'),
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _chewieController!.dispose();
//                         _videoPlayerController1.pause();
//                         _videoPlayerController1.seekTo(const Duration());
//                         _chewieController = ChewieController(
//                           videoPlayerController: _videoPlayerController1,
//                           autoPlay: true,
//                           looping: true,
//                         );
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Landscape Video"),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _chewieController!.dispose();
//                         _videoPlayerController2.pause();
//                         _videoPlayerController2.seekTo(const Duration());
//                         _chewieController = ChewieController(
//                           videoPlayerController: _videoPlayerController2,
//                           autoPlay: true,
//                           looping: true,
//                         );
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Portrait Video"),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _platform = TargetPlatform.android;
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Android controls"),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _platform = TargetPlatform.iOS;
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("iOS controls"),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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

        body: AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayerPlaylist(
              betterPlayerConfiguration: BetterPlayerConfiguration(),
              betterPlayerPlaylistConfiguration:  BetterPlayerPlaylistConfiguration(),
              betterPlayerDataSourceList: createDataSet()
          ),
        )
    );
  }

}



List<BetterPlayerDataSource> createDataSet() {
  List dataSourceList = List<BetterPlayerDataSource>();
  dataSourceList.add(
    BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    ),
  );
  dataSourceList.add(
    BetterPlayerDataSource(BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
  );
  dataSourceList.add(
    BetterPlayerDataSource(BetterPlayerDataSourceType.network,
        "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"),
  );
  return dataSourceList;
}