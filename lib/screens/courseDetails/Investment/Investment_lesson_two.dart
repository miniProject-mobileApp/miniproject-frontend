
import 'package:flutter/material.dart';

class InvestmentLessonTwoScreen extends StatelessWidget{
  const InvestmentLessonTwoScreen({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Investments 2"),
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
      body: Column(

      ),
    );
  }
}