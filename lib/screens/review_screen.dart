import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import '../services/quiz_service.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/loading_animation.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen>
    with SingleTickerProviderStateMixin {
  final QuizService _quizService = QuizService();
  List<Questions>? _questions;
  bool _isLoading = true;
  bool _hasError = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _fetchQuiz();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  Future<void> _fetchQuiz() async {
    try {
      final quiz = await _quizService.fetchQuiz();
      setState(() {
        _questions = quiz.questions?.map((question) {
              // Trim the description and detailedSolution
              question.description = question.description
                  ?.replaceAll(RegExp(r'[\r\n]+'), '')
                  .trim();
              question.detailedSolution = question.detailedSolution
                  ?.replaceAll(RegExp(r'[\r\n]+'), '')
                  .trim();
              return question;
            }).toList() ??
            []; // Provide an empty list if questions is null
        _isLoading = false;
      });
      _controller.forward();
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return LoadingAnimation();
    }

    if (_hasError) {
      return Scaffold(
        body: Center(
          child: Text(
            'Error loading quiz. Please try again.',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.red[700],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review Answers',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal[700],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal[700]!, Colors.teal[100]!],
          ),
        ),
        child: FadeTransition(
          opacity: _animation,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _questions?.length ?? 0,
            itemBuilder: (context, index) {
              final question = _questions![index];
              return Card(
                margin: const EdgeInsets.only(bottom: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                shadowColor: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question ${index + 1}',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        question.description ?? '',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...question.options!.map((option) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: option.isCorrect == true
                                ? Colors.green[50]
                                : Colors.grey[100],
                            border: Border.all(
                              color: option.isCorrect == true
                                  ? Colors.green[300]!
                                  : Colors.grey[300]!,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  option.isCorrect == true
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  color: option.isCorrect == true
                                      ? Colors.green[700]
                                      : Colors.grey[600],
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    option.description ?? '',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      const SizedBox(height: 16),
                      Text(
                        'Explanation:',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        (question.detailedSolution ??
                                'No explanation provided.')
                            .replaceAll('*', '')
                            .trim(),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
