import 'package:adv_flutter/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_flutter/start_screen.dart';
import 'package:adv_flutter/data/questions.dart';
import 'package:adv_flutter/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  //Widget? activeScreen;
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   //activeScreen = StartScreen(switchScreen);
  //   activeScreen = 'question-screen';
  //   super.initState();
  // }

  void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length)
    {
      setState(() {
        selectedAnswers=[];
        activeScreen='results-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      //activeScreen = const QuestionsScreen();
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen')
    {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen')
    {
      screenWidget = ResultScreen(choosenAnswers: selectedAnswers);
    }


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
            // child: activeScreen == 'start-screen'
            //     ? StartScreen(switchScreen)
            //     : const QuestionsScreen()),
            child: screenWidget,
      ),
    ));
  }
}
