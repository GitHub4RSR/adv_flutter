import 'package:flutter/material.dart';
import 'package:adv_flutter/styles/answer_button.dart';
import 'package:adv_flutter/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
      //currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
                style: GoogleFonts.lato(
                    color: Colors.yellow),
                textAlign: TextAlign.center,
                ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: answerQuestion);
            })
            // AnswerButton(answerText: currentQuestion.answers[0], onTap: (){}),
            // AnswerButton(answerText: currentQuestion.answers[1], onTap: (){}),
            // AnswerButton(answerText: currentQuestion.answers[2], onTap: (){}),
            // AnswerButton(answerText: currentQuestion.answers[3], onTap: (){}),
          ],
        ),
      ),
    );
  }
}
