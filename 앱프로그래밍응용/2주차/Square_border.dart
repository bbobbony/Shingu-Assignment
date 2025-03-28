//문제. 테두리만 있는 사각형을 출력하시오
void main() {
  int n = 10;
  for (var i = 0; i < n; i++) {
    String line = "";
    for (var j = 0; j < n; j++) {
      if (i == 0 || i == n - 1 || j == 0 || j == n - 1) {//만약 테두리에 위치 한다면
        line += "*"; // 한줄에서 별을 넣어라
      } else {//위의 조건이 아니라면
        line += " ";//공백을 추가하여라
      }
    }
    print(line);//반복문의 과정을 거친다음 별들의 값이 저장된 line을 출력
  }
}
