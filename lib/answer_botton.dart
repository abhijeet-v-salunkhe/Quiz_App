import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcq/provider/change_question_provider.dart';

class AnswerButton extends ConsumerWidget {
  const AnswerButton({super.key, required this.answer});
  final String answer;
  // final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(changeQuestionProvider.notifier).changeQuestion(answer);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 241, 238, 238),
        foregroundColor: const Color.fromARGB(255, 16, 10, 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      ),
      child: Text(answer,
          textAlign: TextAlign.center,
          style: GoogleFonts.bizUDPGothic(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
