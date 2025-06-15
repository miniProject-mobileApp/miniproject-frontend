import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget{
  const OnboardingScreen({super.key});

  void _onIntroEnd(BuildContext context){
    print("Onboarding complete");
  }


  @override
  Widget build(BuildContext context) {
    
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
      bodyPadding: EdgeInsets.symmetric(horizontal: 16),
      imagePadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      contentMargin: EdgeInsets.all(16)
    );

    return IntroductionScreen(
      key: const Key('onboarding_screen'),
      pages: [
        PageViewModel(
          title: "Learn about finance",
          body: "Fintech offers simple lessons to help you better understand and manage your finances",
          image: Image.asset(
            'assets/images/intro_page_one.png',
            fit: BoxFit.cover,
          ),
          decoration: pageDecoration
        ),


        //page 2
        PageViewModel(
          title: "Stay up to date",
          body: "With our news feature, stay up to date on all news trends",
          image: Image.asset("assets/images/intro_page_two.png", fit: BoxFit.cover),
          decoration: pageDecoration
        ),

        //page 3
        PageViewModel(
          title: "Stay up to date",
          body: "With our news feature, stay up to date on all news trends",
          image: Image.asset("assets/images/intro_page_three.png", fit: BoxFit.cover),
          decoration: pageDecoration,
          footer: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  //navigation for creating account
                  print("Create an account");
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 65),
                ),
                child: const Text("Create an account", style: TextStyle(fontSize: 16),)),
                const SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () {
                    //login logic
                    print("logged in");
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Colors.blue, width: 1)
                    ),
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 65)
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
      skip: const Text("Skip", style: TextStyle(color: Colors.blue)),
      next: const Icon(Icons.arrow_forward, color: Colors.blue),
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