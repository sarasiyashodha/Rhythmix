import 'package:flutter/material.dart';
import 'package:rhythmix/screens/home_page.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final controller = YoutubePlayerController(
    params: YoutubePlayerParams(
      mute: false,
      showControls: true,
      showFullscreenButton: true,
    ),
  );
  runApp(YoutubePlayerControllerProvider(
    controller: controller,
      child: const MyApp()));

  controller.close();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rhythmix",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

