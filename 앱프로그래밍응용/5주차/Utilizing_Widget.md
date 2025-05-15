# 앱프로그래밍응용 5주차과제 위젯 활용하기 DART

### 1.  위젯을 사용하여 컨테이너 배치

#### 결과출력창

<img src="https://github.com/bbobbony/Images/blob/main/%EC%95%B1%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D%20%EA%B3%BC%EC%A0%9C/%EC%95%B1%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D_5%EC%A3%BC%EC%B0%A8_%EC%BB%A8%ED%85%8C%EC%9D%B4%EB%84%88%ED%99%9C%EC%9A%A9.png?raw=true" width="200" height="200" alt="image description" />


<br>

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

<br>


### 2. 그리드뷰를 사용하여 계산기 UI만들어보기

#### 결과출력창 (img태그 사용해 크기조절시 raw=true를 입력해줘야 이미지로 변환이 됨)

<img src="https://github.com/bbobbony/Images/blob/main/%EC%95%B1%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D%20%EA%B3%BC%EC%A0%9C/%EC%95%B1%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%AF%B8%EC%9D%91%EC%9A%A9_5%EC%A3%BC%EC%B0%A8_%EA%B3%84%EC%82%B0%EA%B8%B0.png?raw=true" width="200" height="400" alt="image description" /> 


<br>

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
      title: '위젯을 활용하여 계산기 UI만들어보기',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomePage(), // const 제거! -> 이래야 배열을 메인 페이지로 받아 올 수 있다.
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key}); // const 제거!


  final List<String> buttons = [ //계산기 버튼 위 숫자와 문자를 담는 배열
    '%', '/', '←', 'C',
    '7', '8', '9', '*',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '+/-', '0', '.', '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 상단 검정 화면
            Container(
              width: 400,
              height: 200,
              color: Colors.black,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16),
              child: const Text(
                '0',
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
            ),

            // 아래 노란색 컨테이너 내부에 GridView 배치
            Container(
              width: 400,
              height: 500,
              color: Colors.amberAccent,
              child: GridView.count( //그리드뷰를 사용하기
                crossAxisCount: 4, // 열의 개수
                padding: const EdgeInsets.all(12),
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                children: buttons.map((text) {
                  return Container(
                    decoration: BoxDecoration(
                      color: text.isEmpty ? Colors.transparent : Colors.black, //만약 text가 없다면 색 X, 있다면? 검정색으로 설정해주기
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 30,
                          color: text.isEmpty ? Colors.transparent : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

<br>

### ✅ 코드 속 StatelessWidget을 상속하는 MyApp, MyHomePage는 무엇일까?

|구분|MyApp|MyHomePage|
|--|--|--|
|위치|최상위|MyApp안에 생성|
|역할|앱의 시작점이자 전체 설정등을 이곳에서 정함|우리눈으로 보는 메인화면|
|한계|이 위치에서 생성된 변수를 쓰려면 생성자를 통해서 가져와야 함(번거롭다, 거의 선언 X)|x|

=> 전체설정 칸과 메인페이지 구성칸으로 나뉜다

<br>
<br>

### ✅ 배열선언시 둘다 상수형 데이터타입인 const와 final 무엇이 다른걸까?

|구분|const|final|
|--|--|--|
|선언 시점|컴파일러 시점에 이미 값이 결정|런타임 시점에 한 번만 설정 가능|
|수정 여부|절대 수정 불가(값도 참조도)|참조는 불변이지만 내부값은 수정 가능(기변객체인경우만!)|
|예시| ```dart const list = [1, 2, 3];``` → 값도 수정 불가| ```dart final list = [1, 2, 3];``` → ```dart list[0] = 100;``` 가능!|

=> 값 변경에 대한 유연성의 차이!!

<br>
<br>


