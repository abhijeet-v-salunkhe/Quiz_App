import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcq/qIndex_design.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:mcq/provider/get_summary_provider.dart';

class QuestionSummary extends ConsumerWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context,WidgetRef ref) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QindexDesign(queIndex: data["question_index"],userAnswer: data["user_answer"],correctAnswer: data["correct_answer"],),
                const SizedBox(width: 20,),
                //Text((data['question_index']).toString()),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (data['question'] as String),
                        style: GoogleFonts.notoSansOldTurkic(
                          color: Colors.white,
                          fontSize: 15,
                          
                        ),
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr,
                      ),
                      Text(
                        (data['user_answer'] as String),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 196, 75, 172),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        (data['correct_answer'] as String),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 38, 189, 118),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
          
        ),
      ),
    );
  }
}
