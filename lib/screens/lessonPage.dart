import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/courses/completedCourses.dart';
import 'package:frontend/screens/courses/ongoingCourses.dart';

class LessonScreen extends StatefulWidget{
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  // avoids crashes and slowdowns when no longer in user
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("My courses",),
          centerTitle: true,
        ),
        body: Column(
              children: [
                SizedBox(height: 20,),
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  overlayColor: WidgetStateProperty.resolveWith<Color?>( // splash color
                    (Set<WidgetState> states){
                      if (states.contains(WidgetState.pressed)){
                        return Colors.blue.withValues(alpha: 0.1);
                      }
                      return null;
                    }
                  ),
                  tabs: [
                    Tab(text: "Ongoing",),
                    Tab(text: "Completed",)
                  ],
                  indicatorColor: Colors.blue,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      OngoingCourse(),
                      CompletedCourses()
                    ]
                  ),
                ),
                // Divider( color: Colors.grey,)
              ],
            ),
          ),
    );
  }
}