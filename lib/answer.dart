import 'package:flutter/material.dart';

// ステートレスで実装
class Answer extends StatelessWidget {
  // コールバック関数
  final Function selectHandler;
  final String answerText;

  /// 引数および返却値ありの関数
  /// Function(引数型) 変数名;

  // コンストラクタ
  Answer(this.selectHandler, this.answerText);

  // ビューを定義
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          foregroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.white),
        ),
        child: Text(answerText),
        // ※注：コールバック関数を利用する場合、変数名の指定だけでは実行されないため、必ず「()」をつけること
        onPressed: () => selectHandler(), // 引数の型：VoidCallback
      ),
    );
  }
}
