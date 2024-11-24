import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcq/model/question.dart';
import 'package:mcq/provider/store_answer_provider.dart';

class ChangeQuestionNotifier extends StateNotifier<int> {
  ChangeQuestionNotifier(this.ref) : super(0);
  final ref;
  void changeQuestion( String ans) {
    ref.read(storeAnswerProvider.notifier).storeAnswer(ans);
    if (ref.read(storeAnswerProvider).length == questions.length){
      state = 0; //
    } else {
      state += 1;
    }
    
  }
}
final changeQuestionProvider = StateNotifierProvider<ChangeQuestionNotifier,int>((ref){
  return ChangeQuestionNotifier(ref);
});