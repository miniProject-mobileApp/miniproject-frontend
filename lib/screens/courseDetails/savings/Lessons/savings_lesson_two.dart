import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/screens/quiz/investment/question_one.dart';
import 'package:video_player/video_player.dart';

class SavingsLessonTwo extends StatefulWidget{
  const SavingsLessonTwo({super.key});

  @override
  State<SavingsLessonTwo> createState() => _SavingsLessonTwoState();
}

class _SavingsLessonTwoState extends State<SavingsLessonTwo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isMuted = false;
  

 

  @override
  void initState(){
    super.initState();
      // initializing the controller with the video
    _controller = VideoPlayerController.asset('assets/videos/InvestvidCompressed.mp4');

    // initialize the video player
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {}); // Ensure the first frame is shown after initialization
      _controller.pause();
    });

    // listen to playback state changes to update UI
    _controller.addListener(() {
      setState(() {});
    });
  }


  @override 
  // to free resources
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  // Toggle pause and play
  void _togglePausePlay (){
    setState(() {
      if(_controller.value.isPlaying){
        _controller.pause();
      }else {
        _controller.play();
      }
    });
  }

  // handle mute and sound
  void _toggleAudioMute() {
    setState(() {
      if(_controller.value.volume == 0.0){
        _controller.setVolume(1.0); // unmute
        _isMuted = false;
      }else {
        _controller.setVolume(0.0);
        _isMuted = true;
      }
    });
  }

  // duration
  String _formatDuration(Duration duration){
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return ' $minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Lesson three"),
        centerTitle: true,
        iconTheme:const IconThemeData(color: Colors.blue),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.grey[200],
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.blue),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null, // Show back button if navigation is possible
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return SingleChildScrollView(
              child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                            child: Container(
                              width: screenWidth * 0.9,
                              decoration: BoxDecoration(
                                // border: Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(width: 1, color: Colors.blue)
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(15),
                                child: AspectRatio(
                                      aspectRatio: _controller.value.isInitialized
                                      ? _controller.value.aspectRatio
                                      : 16/ 9,
                                    child: VideoPlayer(_controller),
                                    ),

                                ),
                              ),
                            ),

                          //ProgressBar 
                          SizedBox(height: 15,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: VideoProgressIndicator(
                              _controller, 
                              allowScrubbing: true,
                              colors: VideoProgressColors(
                                playedColor: Colors.blue,
                                bufferedColor: Colors.grey.shade200,
                                backgroundColor: Colors.grey
                              ),
                            ),
                          ),

                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: _toggleAudioMute, 
                                icon: FaIcon(
                                  _isMuted 
                                  ? FontAwesomeIcons.volumeMute
                                  : FontAwesomeIcons.volumeHigh, 
                                  color: Colors.blue,)
                              ),

                              IconButton(
                                onPressed: () {
                                    // backward seek implementation
                                    _controller.seekTo(
                                      _controller.value.position - const Duration(seconds: 10)
                                    );
                                }, 
                                icon: FaIcon(FontAwesomeIcons.backward, color: Colors.blue,)
                              ),
                              // pause and play button
                              IconButton(
                                onPressed: _togglePausePlay,
                                icon: FaIcon(
                                  _controller.value.isPlaying 
                                  ? FontAwesomeIcons.pause 
                                  : FontAwesomeIcons.play,
                                   color: Colors.blue,
                                )
                              ),

                              IconButton(
                                onPressed: () {
                                  _controller.seekTo(
                                    _controller.value.position +  const Duration(seconds: 10)
                                  );
                                }, 
                                icon: FaIcon(FontAwesomeIcons.forward, color: Colors.blue,)
                              ),
                              Text(
                                _controller.value.isInitialized 
                                  ? _controller.value.isPlaying
                                    ? _formatDuration(_controller.value.position)
                                    : _formatDuration(_controller.value.duration)
                                  :'0:00', 
                                style: TextStyle(
                                  fontWeight: FontWeight.bold, 
                                  color: Colors.blue, 
                                  fontSize: 16
                                ),
                              )
                              
                            ],
                          ),
                              

                          
                          SizedBox(height: 35,),
            
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
                            
                          ),
                                  
                                  
                          SizedBox(height: 50,),

                    
                            //attempt quiz button
                            SizedBox(
                              
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white
                                ),
                                onPressed: (){
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(builder: (context) => InvestMentQuizQuestionOne() )
                                  );
                                }, 
                                child: Text("Attempt quiz")
                              ),
                            )   
                        ],
                      ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
         
      ),
    );
  }
}