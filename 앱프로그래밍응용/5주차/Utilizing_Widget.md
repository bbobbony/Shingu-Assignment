# 앱프로그래밍응용 5주차 과제 위젯 활용하기 DART

### 위젯을 사용하여 색별 컨테이너 배치

#### main.dart 코드

```
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 수평 Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 파랑 + 검정 (수직으로 쌓음)
                Container(
                  width: 350,
                  height: 400,
                  color: Colors.red,
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 200,
                          color: Colors.blueAccent,
                        ),
                        Container(
                          width: 150,
                          height: 200,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Container(
                      width: 300,
                      height: 200,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),

            // 아래 수직 노랑
            Container(
              width: 650,
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


