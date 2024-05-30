import 'package:flutter/material.dart';
import 'package:quizapp1/models/question.dart';
import 'package:quizapp1/screens/Result_sereen.dart';
import 'package:quizapp1/widgets/answer_cart.dart';
import 'package:quizapp1/widgets/next_button.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
      final question = questions[questionIndex];

      if (selectedAnswerIndex == question.correctAnswerIndex) {
        score++;
      }
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        selectedAnswerIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Graph Quiz"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.question,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: selectedAnswerIndex == null
                        ? () => pickAnswer(index)
                        : null,
                    child: AnswerCart(
                      question: question.options[index],
                      isSelected: selectedAnswerIndex == index,
                      currentIndex: index,
                      correctAnswerIndex: question.correctAnswerIndex,
                      selectedAnswerIndex: selectedAnswerIndex,
                    ),
                  );
                }),
            isLastQuestion
                ? RectangularButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => ResultScreen(score: score)));
                    },
                    label: 'Finish')
                : RectangularButton(
                    onPressed:
                        selectedAnswerIndex != null ? goToNextQuestion : null,
                    label: 'Next'),
          ],
        ),
      ),
    );
  }
}
