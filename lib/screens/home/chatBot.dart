import 'dart:convert';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/home/basePage.dart';
import 'package:http/http.dart' as http;

class Chatbot extends StatefulWidget{
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, String>> conversationHistory = [];
  bool isLoading = false;
  String? errorMessage;
  String _partialResponse = '';
  Timer? _responseTimer; // dart:async needs to be imported to use Timer

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _responseTimer?.cancel();
    super.dispose();
  }

  Future<void> sendMessage(String message) async {
    if(message.isEmpty) return;

    setState(() {
      isLoading = true;
      conversationHistory.add({"role": "user", "content": message});
      _controller.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });

    try {
      final response = await http.post(
        Uri.parse('http://192.168.186.69:7000/api/v1/chat/message'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'message': message,
          'conversationHistory': conversationHistory,
        })
      );

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        final fullResponse = data['response'] as String;
        setState(() {
          isLoading = false;
          _partialResponse = ''; // reset partial response
          conversationHistory.add({"role": "assistant", "content": ""}); // place holder for streaming
          
        });

        //Stream the response character by character
        int index = 0;
        _responseTimer?.cancel(); // cancel any existing timer
        _responseTimer = Timer.periodic(Duration(milliseconds: 15),(timer) {
          if (index < fullResponse.length){
            setState(() {
              _partialResponse += fullResponse[index];
              conversationHistory.last["content"] = _partialResponse;
            });
            WidgetsBinding.instance.addPostFrameCallback((_){
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut
            );
            });
            index++;
          }else {
            timer.cancel();
          }
        });
        
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to get response ${response.statusCode}';
        });
      }

    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error sending message: $e';
        print(errorMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Ai Tutor"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (BuildContext context) {
            // the Icon button for the drawer is wrapped with Builder
            // it ensures that Scaffold.of(context) can find the ancestor Scaffold and call openDrawer
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }, 
              
            );
          }
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                
              ),
              child: Text(
                'Mesurmon',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blue, size: 30,),
              title: Text("Home", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => BaseScreen())
                );
              },
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child:Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: conversationHistory.length +  (isLoading ? 1 : 0), // add one for loader
                    itemBuilder: (context, index) {
                      if (isLoading && index == conversationHistory.length){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: SpinKitDoubleBounce(
                                  color: Colors.blue,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      // display response and input messages
                      final message = conversationHistory[index];
                      final isUser = message['role'] == 'user';
                      return Align(
                        // aligning text based on input from user and response from chatbot
                        alignment: isUser ? Alignment.centerRight: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isUser ? Colors.blue.shade100 : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text(
                            message['content']!, // need to provide comment
                            style: TextStyle(fontSize: 16, color: isUser ? Colors.blue.shade900 : Colors.black),
                          ),
                        ),
                      );
                    }
                  )
                ),
                
                if(errorMessage != null)
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(errorMessage!, style: TextStyle(color: Colors.red),),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        
                        child: Theme(
                          // Handles the colors cursor and text background when highlighted
                          data: Theme.of(context).copyWith(
                            textSelectionTheme: TextSelectionThemeData(
                              cursorColor: Colors.blue,
                              selectionColor: Colors.blue.withValues(alpha: 0.4),
                              selectionHandleColor: Colors.blue
                            ),
                          
                          ),
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: "Ask anything...",
                              hintStyle: TextStyle(color: Colors.white),
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blue)
                              ),
                              //background color of text field
                              filled: true,
                              fillColor: Colors.blue.shade200,
                              
                            ),
                            // text style
                            style: TextStyle(color: Colors.white),
                            maxLines: null, // Allows the text field to extend downwards
                            minLines: 1,
                            keyboardType: TextInputType.multiline,
                             
                          ),
                        )
                      ),
                      SizedBox(width: 12,),
                      IconButton(
                        onPressed: () => sendMessage(_controller.text),
                        iconSize: 30,
                        icon: Icon(Icons.send_outlined, color: Colors.blue, )
                      )
                    ],
                  ),
                )
              ],
            ),
          
        ),
      ); 
    
  }
}