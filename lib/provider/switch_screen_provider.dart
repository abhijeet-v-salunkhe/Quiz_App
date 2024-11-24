import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcq/provider/store_answer_provider.dart';

class SwitchScreenNotifier extends StateNotifier<String> {
  SwitchScreenNotifier(this.ref) : super ( "First-Screen" );
  final ref;

  void switchScreen( String screen ) {
    if(screen == "Restart"){
      ref.read(storeAnswerProvider.notifier).storeAnswer("//Restart_KIYA");
      state = "Questions-Screen";
    }
    state = screen;
  }


}

final switchScreenProvider = StateNotifierProvider< SwitchScreenNotifier, String >((ref) {
  return SwitchScreenNotifier(ref);
});
