import 'package:flutter/material.dart';

// リザルト画面をステートレスで実装
class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  // コンストラクタ
  Result(this.resultScore, this.resetHandler);

  // ゲッター
  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 10) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 20) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 30) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  // ビュー(build関数内にビュー(UI)を定義)
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // デフォルトでは背景色なしのボタン(htmlのaタグ(リンク)のような感じ)
          TextButton(
            child: Text('Restart Quiz!'),
            onPressed: () => resetHandler(),
          ),
        ],
      ),
    );
  }
}
