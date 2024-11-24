import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcq/answer_botton.dart';
import 'package:mcq/model/question.dart';
//import 'package:mcq/quize_question.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:mcq/provider/change_question_provider.dart';
// import 'package:mcq/provider/store_answer_provider.dart';


class QuestionsScreen extends ConsumerStatefulWidget {
  const QuestionsScreen({super.key});


  @override
  ConsumerState<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}
class _QuestionsScreenState extends ConsumerState<QuestionsScreen> {
  

  
  @override
  Widget build(context) {
    
    
    final currentQuestionIndex = ref.watch(changeQuestionProvider);
    //print(currentQuestionIndex);
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
                color: const Color.fromARGB(255, 211, 153, 245),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getshuffledanswer().map((ans) {
              return AnswerButton(
                  answer: ans
                  
                  );
            }),
          ],
        ),
      ),
    );
  }
}
