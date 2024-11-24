
class QuizeQuestion{
  QuizeQuestion(this.text,this.answers);

  final String text;
  final List<String> answers;

  List<String> getshuffledanswer(){
    final copyAnswer = List.of(answers);
    copyAnswer.shuffle();
    return copyAnswer;
  }
}