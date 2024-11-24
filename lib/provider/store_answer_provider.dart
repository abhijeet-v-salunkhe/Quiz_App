import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcq/model/question.dart';
import 'package:mcq/provider/switch_screen_provider.dart';

class StoreAnswerNotifier extends StateNotifier<List<String>> {
  StoreAnswerNotifier(this.ref) : super([]);
  final ref;
  void storeAnswer(String ans) {
    if ("//Restart_KIYA" == ans){
      state = [];
    }
    state = [...state, ans];
    if (state.length == questions.length) {
      ref.read(switchScreenProvider.notifier).switchScreen("Result-Screen");
    }
  }
}

final storeAnswerProvider =
    StateNotifierProvider<StoreAnswerNotifier, List<String>>((ref) {
  return StoreAnswerNotifier(ref);
});
