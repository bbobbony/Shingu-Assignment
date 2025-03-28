# 신구대학교 컴퓨터소프트웨어과 과제제출
### 신구대학교 과제들을 제출하는 레포지토리입니다. 서로의 코드와 동작성을 보며 함께 성장해보아요.🤩 

<br>

```dart
import 'package:flutter/material.dart'; // Flutter의 위젯 관련 라이브러리 불러오기

void main() {
  runApp(const MyApp()); // MyApp 위젯을 앱의 루트 위젯으로 실행
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // MyApp 클래스는 상태가 없는 StatelessWidget으로, 앱의 루트 위젯

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp은 Flutter 앱의 기본 구조를 정의하는 위젯
      title: 'Flutter Demo', // 앱의 제목 설정
      theme: ThemeData( // 앱의 테마 설정
        primarySwatch: Colors.blue, // 앱에서 사용할 기본 색상 설정
      ),
       home: const MyHomePage(title: '신구대학교 화이팅!'), // home 속성에 MyHomePage 위젯을 설정
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title}); // MyHomePage는 상태가 없는 StatelessWidget이며, title을 받음

  final String title; // title 변수 선언!

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold는 앱의 기본적인 구조(앱바, 본문 등)를 설정하는 위젯
      appBar: AppBar( // 앱의 상단 바를 정의하는 위젯
        title: Text(title), // 앱바의 타이틀로 전달된 title 변수 출력
      ),
      body: Center( // 화면의 중앙에 위젯을 배치할 때 사용
        child: Text(
          title, // 화면 중앙에 출력할 문자열
          style: const TextStyle(fontSize: 40), // 텍스트의 스타일을 정의 (글자 크기 40)
        ),
      ),
    );
  }
}```
