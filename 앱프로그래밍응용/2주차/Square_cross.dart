//문제. 사각형 위에 엑스자 모양으로 겹쳐진 대각선을 함께 출력하시오.
void main() {
  int n = 10;
  for (var i = 0; i < n; i++) {
    String line = "";
    for (var j = 0; j < n; j++) {
      if (i == 0 || i == n - 1 || j == 0 || j == n - 1 || i == j || i + j == n - 1) {
        line += "*"; // 테두리와 대각선 부분 출력
      } else {
        line += " "; // 내부는 공백
      }
    }
    print(line);
  }
}
