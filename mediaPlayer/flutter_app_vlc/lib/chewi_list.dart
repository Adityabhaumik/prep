// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class ChewieListItem extends StatefulWidget {
//   final VideoPlayerController videoPlayerController;
//   final bool looping;
//
//   ChewieListItem({@required this.videoPlayerController, this.looping});
//
//   @override
//   _ChewieListItemState createState() => _ChewieListItemState();
// }
//
// class _ChewieListItemState extends State<ChewieListItem> {
//   ChewieController _chewieController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _chewieController = ChewieController(
//       videoPlayerController: widget.videoPlayerController,
//       aspectRatio: 16 / 9,
//       autoInitialize: true,
//       looping: widget.looping,
//       errorBuilder: (context,m){
//         return Center(
//           child: Text('error',style: TextStyle(color: Colors.white),),
//         );
//       }
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       child: Chewie(
//         controller: _chewieController,
//       ),
//     );
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     widget.videoPlayerController.dispose();
//     _chewieController.dispose();
//   }
// }
//
