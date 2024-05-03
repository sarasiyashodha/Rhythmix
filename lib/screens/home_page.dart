import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../components/custom_montserrat_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<String> songNames = [
    "Song 1",
    "Song 2",
    "Song 3",
    "Song 4",
    "Song 5",
    "Song 6",
  ];

  late List<String> videoIds = [
    "n9LeEsu6ymk",
    "SitJvj-8VZg",
    "3I8hL2FBwCI",
    "i5L6CzTAv_w",
    "n705cqvksmo",
    "EefDoCweGcM"
  ];

  late List<bool> _isHoveringImageList;
  late List<bool> _isHoveringIconList;

  @override
  void initState() {
    super.initState();
    _isHoveringImageList = List.generate(songNames.length, (_) => false);
    _isHoveringIconList = List.generate(songNames.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Row(
        children: [
          Container(
            color: Colors.black, width: 200,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.music_note, color: Colors.white,),
                    SizedBox(
                      width: 5,
                    ),
                    CustomMontserratText(
                      color: Colors.white,
                      text: "Rhythmix",
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        songNames.length,
                            (index) => CustomMontserratText(
                          color: Colors.white38,
                          text: songNames[index],
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.music_note, color: Colors.white, size: 40,),
                  SizedBox(
                    width: 5,
                  ),
                  CustomMontserratText(
                    color: Colors.white,
                    text: "Rhythmix",
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              CustomMontserratText(
                color: Colors.white,
                text: "Pick your music",
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
              SizedBox(height: 10,),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: songNames.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              MouseRegion(
                                onEnter: (_) => setState(() {
                                  _isHoveringImageList[index] = true;
                                }),
                                onExit: (_) => setState(() => _isHoveringImageList[index] = false),
                                child: Container(
                                  height: 200,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage("assets/images/image$index.jpg"), fit: BoxFit.cover),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: MouseRegion(
                                    onEnter: (_) => setState(() {
                                      _isHoveringIconList[index] = true;
                                    }),
                                    onExit: (_) => setState(() => _isHoveringIconList[index] = false),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      decoration: BoxDecoration(
                                        color: _isHoveringIconList[index] ? Colors.white : Colors.transparent,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: _isHoveringIconList[index] ? Colors.white : _isHoveringImageList[index] ? Colors.white : Colors.transparent, // Change border color based on hover state
                                          width: 2, // Adjust border width as needed
                                        ),
                                      ),
                                      child: YoutubePlayerControllerProvider(
                                        controller: YoutubePlayerControllerProvider.of(context),
                                        child: Builder(
                                          builder: (context) {
                                            return YoutubeValueBuilder(
                                              builder: (context, value) {
                                                final isPlaying = value.playerState == PlayerState.playing;
                                                return IconButton(
                                                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                                                    color: _isHoveringIconList[index] ? Colors.black : _isHoveringImageList[index] ? Colors.white : Colors.transparent,
                                                  ),
                                                  color: _isHoveringIconList[index] ? Colors.white : _isHoveringImageList[index] ? Colors.transparent : Colors.transparent,
                                                  onPressed: (){
                                                    // _controller.cueVideoById(videoId: videoIds[index]);
                                                    YoutubePlayerControllerProvider.of(context).loadVideoById(videoId: videoIds[index]);
                                                  },
                                                  hoverColor: Colors.white,
                                                  highlightColor: Colors.transparent,
                                                  focusColor: Colors.transparent,
                                                  iconSize: 24,
                                                );
                                              },
                                            );
                                          }
                                        ),
                                      ),

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          CustomMontserratText(
                            color: Colors.black,
                            text: songNames[index],
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          )),


        ],
      ),

    );
  }

}
