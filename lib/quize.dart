import 'package:flutter/material.dart';
import 'package:mcq/first_screen.dart';
import 'package:mcq/questions_screen.dart';
//import 'package:mcq/model/question.dart';
import 'package:mcq/result_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcq/provider/switch_screen_provider.dart';

class Quize extends ConsumerStatefulWidget {
  const Quize({super.key});
  @override
  ConsumerState<Quize> createState() {
    return _QuizeState();
  }
}

class _QuizeState extends ConsumerState<Quize> {
  var activeScreen = "First-Screen";
  List<String> clickedAnswer = []; 

  @override
  Widget build(context) {
    activeScreen = ref.watch(switchScreenProvider);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 61, 6, 107),
                Color.fromARGB(255, 136, 27, 195)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: activeScreen == "First-Screen" ? const FirstScreen(/*switchScreen*/) : activeScreen == "Result-Screen"? ResultScreen(): QuestionsScreen(/*onSelectedAnswer: storeAnswer,*/) ,
        ),
      ),
    );
  }
}
