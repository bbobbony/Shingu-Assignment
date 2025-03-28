# 앱프로그래밍응용 현재시각출력 Dart

<br>

### Flutter프로젝트 중 main.dart
```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 날짜 포맷을 위해 추가

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '현재 시각을 표시하는 앱',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '현재 시각 ⏰'),
      debugShowCheckedModeBanner: false, // DEBUG마크 배너 없애기
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentTime = '';  // 초기값을 빈 문자열로 설정
  late Timer _timer;         // 1초마다 시간을 갱신할 변수

  @override
  void initState() {
    super.initState();
    _updateTime();  // 앱 시작 시 현재 시간 초기화
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();  // 1초마다 시간 갱신
    });
  }

  // 시간을 업데이트하는 메서드
  void _updateTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat('yyyy-MM-dd a hh:mm:ss').format(now); // 원하는 형식으로 날짜 및 시간 포맷
    print(formattedTime); // 콘솔에 출력하여 시간이 제대로 갱신되는지 확인
    setState(() {
      _currentTime = formattedTime;  // _currentTime에 값 할당
    });
  }

  @override
  void dispose() {
    _timer.cancel();  // 타이머 종료 (메모리 효율을 위해 필수적인 함수)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Text(
          _currentTime, //현재시간 출력하기!!!!
          style: const TextStyle(fontSize: 35),
          textAlign: TextAlign.center, // 텍스트 중앙 정렬
        ),
      ),
    );
  }
}

```
