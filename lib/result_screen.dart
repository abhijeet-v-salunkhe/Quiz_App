import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcq/model/question.dart';
//import 'package:mcq/provider/get_summary_provider.dart';
import 'package:mcq/provider/switch_screen_provider.dart';
import 'package:mcq/question_summary.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcq/provider/store_answer_provider.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key,});
  
  List<Map<String, Object>> getSummary(var choosenAnswers) {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      //print(questions[i].answers[0]);
      summary.add({
        'question_index': i + 1,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final choosenAnswers = ref.read(storeAnswerProvider);
    final List<Map<String, Object>> summaryData = getSummary(choosenAnswers);
    final numofQuestions = questions.length;
    //print(summaryData.length);
    final numofCorrectAns = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered correct $numofCorrectAns out of $numofQuestions from the question",
              style: GoogleFonts.lato(
                color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: (){
                ref.read(switchScreenProvider.notifier).switchScreen("Restart");
                },
              child: const Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }
}
