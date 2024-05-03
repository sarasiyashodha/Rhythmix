// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// class VideoPlayerPage extends StatelessWidget {
//   final String videoUrl;
//
//   const VideoPlayerPage({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: Center(
//         child: YoutubePlayer(
//           controller: YoutubePlayerController(
//             initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
//             flags: YoutubePlayerFlags(
//               autoPlay: true,
//               mute: false,
//             ),
//           ),
//           showVideoProgressIndicator: true,
//           progressIndicatorColor: Colors.blue,
//           progressColors: ProgressBarColors(
//             playedColor: Colors.blue,
//             handleColor: Colors.blueAccent,
//           ),
//           onReady: () {
//             // Perform any actions when the video is ready to play
//           },
//         ),
//       ),
//     );
//   }
// }
