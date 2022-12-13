import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

// クイズ画面をステートレスで実装
class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  // コンストラクタ
  Quiz(
      {required this.questions,
      required this.questionIndex,
      required this.answerQuestion});

  // ビューを定義
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 別ファイルで定義したビューを取得
        Question(
          questions[questionIndex]['questionText'].toString(),
        ),

        /// ...(スプレッド演算子) ：返却されたリストの要素をを取り出し、要素の分だけ処理を行う
        /// as 〇〇〇 ... キャスト
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          // => ...アロー関数
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
