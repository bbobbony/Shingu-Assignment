# 앱프로그래밍응용 6주차과제   Stack구조와 push(), pop()출력  DART

## 페이지 이동간의 push, pop의 형태로 이동되는 stack구조와 생명주기 대해 알아보자!

<br>

### 1-1 . StatelessWidget(정적 위젯)의 build() 동작

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
<br>

#### <StatelessWidget build() 동작 출력>
![image description](https://github.com/bbobbony/Images/blob/main/StatelessWidgetbulid()%20%EC%8B%A4%ED%96%89%20%EC%88%9C%EC%84%9C.png)

<br>
<br>


### 2. StatefulWidget(동적 위젯)의 생명주기 동작
//init(), build(), dispose()

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: FirstStatefulPage(),
    );
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

// First Page (Stateful)
class FirstStatefulPage extends StatefulWidget {
  @override
  _FirstStatefulPageState createState() => _FirstStatefulPageState();
}

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
      home: FirstStatefulPage(),
    );
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

// First Page (Stateful)
class FirstStatefulPage extends StatefulWidget {
  @override
  _FirstStatefulPageState createState() => _FirstStatefulPageState();
}

class _FirstStatefulPageState extends State<FirstStatefulPage> {
  @override
  void initState() { //init
    super.initState();
    print('FirstPage initState()');
  }

  @override
  void dispose() {//dispose
    super.dispose();
    print('FirstPage dispose()');
  }

  @override
  Widget build(BuildContext context) {
    print('FirstPage build()'); 
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: ElevatedButton(
        child: Text('다음 페이지로'),
        onPressed: () {
          final person = Person('홍길동', 20);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondStatefulPage(person: person),
            ),
          );
        },
      ),
    );
  }
}

// Second Page (Stateful)
class SecondStatefulPage extends StatefulWidget {
  final Person person;

  // 생성자에서 key는 선택(optional)으로 바꿔도 되고 안 넣어도 됨.
  const SecondStatefulPage({Key? key, required this.person}) : super(key: key);

  @override
  _SecondStatefulPageState createState() => _SecondStatefulPageState();
}

class _SecondStatefulPageState extends State<SecondStatefulPage> {

  @override
  void initState() { //init
    super.initState();
    print('SecondPage initState()');
  }

  @override
  void dispose() {//dispose
    super.dispose();
    print('SecondPage dispose()');
  }

  @override
  Widget build(BuildContext context) {
    print('SecondPage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.person.name),
      ),
      body: ElevatedButton(
        child: Text('이전 페이지로'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

```

<br>


#### <StatefulWidget init(), build(), dispose() 동작 출력>

![image discription](https://github.com/bbobbony/Images/blob/main/StatefulWidget%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0.png)
