import 'package:flutter/material.dart';

class QindexDesign extends StatelessWidget {
  const QindexDesign({super.key, required this.queIndex,required this.userAnswer,required this.correctAnswer});
  final Object? queIndex;
  final Object? userAnswer;
  final Object? correctAnswer;
  @override
  Widget build(context) {
     int a = 255;
      int b = 248;
      int c = 10;
      int d = 217;
    if(userAnswer as String != correctAnswer as String){
       a = 255;
       b = 8;
       c = 219;
       d = 230;
    }
    
    return 
    Container(
      width: 30,
      height: 30,
      decoration:  BoxDecoration(
        
        color: Color.fromARGB(a,b,c,d),
        shape: BoxShape.circle,
      ),
      
      child: Center(child: Text(queIndex.toString(),style: const TextStyle(color: Colors.white),)),
    );
  }
}
