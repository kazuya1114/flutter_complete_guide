import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

/// Stateful(画面情報が更新された際にUIに適応するために利用)で実装
/// StatefulWidgetを継承
/// State<StatefulWidget> createState()メソッドをオーバーライド
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // UIレンダリングが実行された際に更新・表示を行うビューオブジェクトを返却
    return _MyAppState();
  }
}

/// State<MyApp>を継承
/// クラス名の先頭に「_」を付加することでプライベートクラスとして宣言可能(変数や関数も同様)
class _MyAppState extends State<MyApp> {
  // プライベート変数
  int _questionIndex = 0;
  int _totalScore = 0;
  // 表示する質問内容
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 4},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 2},
        {'text': 'white', 'score': 1},
        {'text': 'black', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 4},
        {'text': 'Snake', 'score': 3},
        {'text': 'Elephant', 'score': 1},
        {'text': 'Lion', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your favorite foods?',
      'answers': [
        {'text': 'sushi', 'score': 9},
        {'text': 'potato', 'score': 6},
        {'text': 'rice', 'score': 3}
      ]
    },
  ];

  // プライベート関数
  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      print('answer 1');
      // questionIndexが更新されたらUIレンダリングを実行
      setState(() =>
          _questionIndex++); // FlutterにUIレンダリングを実行させる関数(具体的には、再度build関数を実行させることでレンダリングを行う)
    } else {
      print('No more questions!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // ビュー情報を記載
        appBar: AppBar(
          title: Text('My First App'),
        ), // AppBarウィジェットにTextウィジェットを渡す
        // 三項演算子：_questionIndexが_questions.lengthより小さい場合、Quizを描画、それ以外の場合、Resultを描画
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,

                /// _関数名：コールバック関数 ...指定した関数を引数として受け渡せるため、別クラスで利用可能
                /// 原理として、関数のアドレスを受け渡せるため、引数として受け取ったクラスでもアドレスを参照して
                /// 関数を利用することができる。
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

// int addNumbers(int num1, int num2) => num1 + num2;

// void main() {
//   int? result = addNumbers(1, 4);
//   result = null;
//   debugPrint(result.toString());
//   Person person = new Person(name: '秦', age: 22, affilication: '開発センター');
// }

// クラスの実装(アプリでは未使用)
class Person {
  String name;
  int age;
  String affilication;

  // コンストラクター
  Person({this.name = '', this.age = 0, this.affilication = ''});

  // ゲッター
  String getName() => name;
  int getAge() => age;
  String getAffilication() => affilication;

  // セッター
  void setName(name) => this.name = name;
  void setAge(age) => this.age = age;
  void setAffilication(affilication) => this.affilication = affilication;
}
