import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/login_page.dart';
// import 'package:frontend/screens/oldLoginPage.dart';
import 'package:frontend/screens/auth/signUpPage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget{
  const OnboardingScreen({super.key});

  void _onIntroEnd(BuildContext context){
    print("Onboarding complete");
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    
    // default page decorations for onboarding screens
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.blue
      ),
      bodyPadding: EdgeInsets.zero,
      imagePadding: EdgeInsets.zero,
      imageFlex: 2, // gives the image two times more vertical space
      bodyFlex: 1,
      contentMargin: EdgeInsets.all(10)
    );

  
    return IntroductionScreen(
      key: const Key('onboarding_screen'),
      pages: [
        PageViewModel(
          title: "Learn about finance",
          body: "Fintech offers simple lessons to help you better understand and manage your finances",
          image: Container(
            margin: EdgeInsets.only(
              top: screenHeight * 0.15,
              left: 16,
              right: 16
            ),
            child: Image.asset(
              'assets/images/intro_page_one.png',
              fit: BoxFit.cover,
            ),
          ),
          decoration: pageDecoration
        ),


        //page 2
        PageViewModel(
          title: "Stay up to date",
          body: "With our news feature, stay up to date on all news trends",
          image: Container(
            margin: EdgeInsets.only(
              top: screenHeight * 0.15,
              left: 16,
              right: 16
            ),
            child: Image.asset("assets/images/intro_page_two.png", fit: BoxFit.cover),
          ),
          decoration: pageDecoration
        ),

        //page 3
        PageViewModel(
          title: "Learn more",
          body: "With our news feature, stay up to date on all news trends",
          image: Container(
            margin: EdgeInsets.only(
              top: screenHeight * 0.15,
              left: 20, 
              right: 20
            ),
            child: Image.asset(
              "assets/images/intro_page_three.png", 
              fit: BoxFit.cover,
              width: 300,
              height: 300,
              ),
          ),
          decoration: pageDecoration,
          footer: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  //navigation for creating account
                  Navigator.push(
                    context, 
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => SignUpScreen(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1, 0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                        var offSetAnimation = animation.drive(tween);

                        return SlideTransition(position: offSetAnimation, child: child);
                      }, 
                      transitionDuration: Duration(milliseconds: 500)
                    )
                  );
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  elevation: 0,
                  minimumSize: const Size(200, 65),
                ),
                child: const Text("Create an account", style: TextStyle(fontSize: 16),)),
                const SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1, 0); // start the new screen from the right
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          var offSetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offSetAnimation,
                            child: child,
                          );
                        },
                        transitionDuration: Duration(milliseconds: 500)
                      )
                    );
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Colors.blue, width: 1)
                    ),
                    elevation: 0,
                    minimumSize: const Size(200, 65)
                  ),
                  child: const Text("I already have an account", style: TextStyle(fontSize: 16),)
                )
            ],
          )
        )
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      showNextButton: true,
      skip: const Text("Skip", style: TextStyle(color: Colors.blue, fontSize: 16)),
      next: const Icon(Icons.arrow_forward, color: Colors.blue, size: 30,),
      done: const Text("Done", style: TextStyle(color: Colors.blue)),
      dotsDecorator: const DotsDecorator(
        size: Size(10, 10),
        color: Colors.grey,
        activeColor: Colors.blue,
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(25))
        )
      ),
      globalBackgroundColor: Colors.white,
    );
  }
}

