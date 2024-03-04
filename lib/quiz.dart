import 'package:adv_flutter/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_flutter/start_screen.dart';
import 'package:flutter/rendering.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //Widget? activeScreen;
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   //activeScreen = StartScreen(switchScreen);
  //   activeScreen = 'question-screen';
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      //activeScreen = const QuestionsScreen();
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 78, 13, 151),
                  Color.fromARGB(255, 107, 15, 168),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            //child: activeScreen),
            child: activeScreen == 'start-screen'
                ? StartScreen(switchScreen)
                : const QuestionsScreen()),
      ),
    );
  }
}
