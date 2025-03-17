//문제. 사각형의 테두리만을 출력하되 가로지르는 대각선 또한 함께 출력하여라

//왼 -> 오
// void main() { 
//   int n = 10;
//   for (var i = 0; i < n; i++) {
//     String line = "";
//     for (var j = 0; j < n; j++) {
//       if (i == 0 || i == n - 1 || j == 0 || j == n - 1 || i==j) { //i와 j기 같다는 조건을 추가하여 왼쪽에서 오른쪽으로 내려오는 대각선 추가
//         line += "*";
//       } else {
//         line += " ";
//       }
//     }
//     print(line);
//   }
// }

//오 -> 왼
void main() {
  int n = 10;
  for (var i = 0; i < n; i++) {
    String line = "";
    for (var j = 0; j < n; j++) {
      if (i == 0 || i == n - 1 || j == 0 || j == n - 1 || i+j==n-1) {//조건에 i+j==n-1 추가하여 오른쪽에서 왼쪽으로 내려오는 대각선 추가
        line += "*";
      } else {
        line += " ";
      }
    }
    print(line);
  }
}


