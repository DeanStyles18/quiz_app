import 'package:flutter/material.dart';
import '../widgets/fade_animation.dart';
import 'review_screen.dart';
import 'menu_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String quizTitle;

  const ResultScreen(
      {super.key,
      required this.score,
      required this.totalQuestions,
      required this.quizTitle});

  String _getResultMessage() {
    final percentage = (score / 40) * 100;
    if (percentage == 100) {
      return 'Perfect Score! You\'re a Quiz Master!';
    } else if (percentage >= 80) {
      return 'Great job! You\'re almost there!';
    } else if (percentage >= 60) {
      return 'Good effort! Keep practicing!';
    } else {
      return 'Don\'t give up! Try again!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (score / 40) * 100;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [Colors.indigo, Colors.indigoAccent],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: FadeAnimation(
              duration: const Duration(milliseconds: 1000),
              child: Card(
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        percentage >= 80
                            ? Icons.emoji_events
                            : percentage >= 60
                                ? Icons.star
                                : Icons.psychology,
                        size: 80,
                        color: percentage >= 80 ? Colors.amber : Colors.indigo,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        '$quizTitle Completed!',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Score: $score / 40',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _getResultMessage(),
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => MenuScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.replay, color: Colors.white),
                        label: const Text('Try Another Quiz',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          textStyle: const TextStyle(fontSize: 18),
                          backgroundColor: Colors.indigo,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ReviewScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.visibility, color: Colors.white),
                        label: const Text('Review Answers',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          textStyle: const TextStyle(fontSize: 18),
                          backgroundColor: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
