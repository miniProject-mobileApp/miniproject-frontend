import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TradingBasicsScreen extends StatefulWidget{
  const TradingBasicsScreen({super.key});

  @override
  State<TradingBasicsScreen> createState() => _TradingBasicsScreenState();
}

class _TradingBasicsScreenState extends State<TradingBasicsScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState(){
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'qIw-yFC-HNU',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        showLiveFullscreenButton: false,
        enableCaption: false,
        mute: false
      )
    );
  }


  @override 
  // to free resources
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Basics of Investments"),
        centerTitle: true,
        iconTheme:const IconThemeData(color: Colors.blue),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.amber,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.blue),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null, // Show back button if navigation is possible
      ),
      body: Column(
        
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 30),
            child: Container(
              width: screenWidth * 0.9,
              
              decoration: BoxDecoration(
                // border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(15)
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressColors: ProgressBarColors(
                      playedColor: Colors.blue,
                      handleColor: Colors.blue
                    ),
                    onReady: (){
                      print("player is ready");
                    },
                    onEnded: (metaData) {
                      print("video has ended");
                    },
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20,),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Summary", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),),
              ],
            ),
          ),

          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: screenWidth * 0.9,
              // height: 150,
              // decoration: BoxDecoration(
              //   border: Border.all(width: 1, color: Colors.grey),
              //   borderRadius: BorderRadius.circular(15)
              // ),
              
              child: Text("The video explains how investing helps build long-term wealth by redirecting money from present use to future gains. It covers key concepts like stocks and bonds, the role of financial institutions, the importance of diversification to reduce risk, and how starting early allows compound interest to significantly grow investments over time."),
            ),
            
            
          )
          
        ],
      ),
    );
  }
}