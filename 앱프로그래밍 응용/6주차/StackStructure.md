# 앱프로그래밍응용 6주차과제   Stack구조와 push(), pop()출력  DART

## 페이지 이동간의 push, pop의 형태로 이동되는 stack구조에 대해 알아보자!

<br>

### 1. StatelessWidget(정적 위젯)의 클래스 동작

#### main.dart

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: FirstPage(), //처음으로 보여질 페이지를 FirstPage로 설정
    );
  }
}

//dart.main과 같은 위치에 따로 FirstPage.dart로 만들어 import해도 무방하다
//그러나 편리함을 위해 한페이지에 작성하였다.

class FirstPage extends StatelessWidget{//첫번째페이지
  @override
Widget build(BuildContext context){
    print('FirstPage build()');
    return Scaffold(
      appBar: AppBar(
        title:Text('FirstPage'),
      ),
      body: ElevatedButton(
        child: Text('다음페이지로'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget{//두번째페이지
  @override
  Widget build(BuildContext context) {
    print('SecondPage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: ElevatedButton(
        child: Text('이전페이지로'),
        onPressed: () {
          Navigator.pop(context);
          print('ok');
        },
      ),
    );
  }
}
```

#### build() 동작 출력
![image description]
