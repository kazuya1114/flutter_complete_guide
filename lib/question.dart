import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ステートレスで実装
class Question extends StatelessWidget {
  // 質問内容(コンストラクタで設定された質問内容から変更されることはないため、final宣言)
  final String _questionText;

  // コンストラクタ
  Question(this._questionText);

  // ビューを定義
  @override
  Widget build(BuildContext context) {
    // ビューを返却
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        _questionText,
        style: const TextStyle(fontSize: 28), // cssスタイル
        textAlign: TextAlign.center,
      ),
    );
  }
}
