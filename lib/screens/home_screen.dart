import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../widgets/fade_animation.dart';
import 'menu_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.indigo[900]!,
              Colors.indigo[700]!,
              Colors.indigo[500]!,
            ],
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.jpg'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              FadeAnimation(
                duration: Duration(milliseconds: 1500),
                child: Icon(
                  Icons.quiz,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24),
              FadeAnimation(
                duration: Duration(milliseconds: 2000),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Quiz Master',
                        speed: Duration(milliseconds: 200),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ),
              ),
              SizedBox(height: 16),
              FadeAnimation(
                duration: Duration(milliseconds: 2500),
                child: Text(
                  'Test your knowledge!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(32.0),
                child: FadeAnimation(
                  duration: Duration(milliseconds: 3000),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the MenuScreen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MenuScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.indigo,
                      minimumSize: Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start Quiz',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_rounded),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
