//문제. 2단부터 9단까지 구구단을 출력하여라
void main() {
  for (var i = 2; i < 10; i++) {
    for (var j = 1; j < 10; j++) {
      print('$i * $j = ${i * j}');
    }
    print('');
  }
}