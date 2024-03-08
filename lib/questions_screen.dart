import 'package:flutter/material.dart';
import 'package:adv_flutter/styles/answer_button.dart';
import 'package:adv_flutter/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectAnswers) {
    widget.onSelectAnswer(selectAnswers);
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
                    color:const Color.fromARGB(255, 140, 175, 229),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: (){
                answerQuestion(answer);
              });
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
