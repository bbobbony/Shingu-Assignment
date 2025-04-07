# 앱프로그래밍응용 5주차 과제 위젯 활용하기 DART

### 위 이미지대로 위젯 활용해보기

#### main.dart 코드

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '컨테이너 활용해보기',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 빨강 대신 파란 컨테이너 2개를 수평으로 배치
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  height: 400,
                  color: Colors.red,
                ),
                Container(
                  width: 500,
                  height: 400,
                  color: Colors.black,
                ),
              ],
            ),
            // 노랑 컨테이너 아래쪽에 배치
            Container(
              width: 1000,
              height: 400,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }


}


```
