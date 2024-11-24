import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetSummaryNotifier extends StateNotifier<List<Map<String, Object>>> {
  GetSummaryNotifier(this.ref) : super([]);
  final ref;

  void getSummary(List<Map<String, Object>> summary) {
    state = summary;
  }
}

final getSummaryProvider =
    StateNotifierProvider<GetSummaryNotifier, List<Map<String, Object>>>((ref) {
  return GetSummaryNotifier(ref);
});
