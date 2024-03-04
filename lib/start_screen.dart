import 'package:flutter/material.dart';
//import 'package:adv_flutter/quiz.dart';

class StartScreen extends StatelessWidget {
  const StartScreen( this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
          Image.asset( 'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(131, 249, 249, 249),
          ),

        // Opacity(
        //   opacity: .6,
        //   child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     width: 300,
        //   ),
        // ),
        const SizedBox(height: 80),
        const Text(
          'Learn Flutter The Fun Way',
          style: TextStyle(
              color: Color.fromARGB(255, 165, 183, 233), fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'))
      ],
    )
        //Text('Start Screen')
        );
  }
}
