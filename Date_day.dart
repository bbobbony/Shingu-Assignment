//Q. 날짜를 넣으면 해당하는 요일을 출력하거라!
void main() {
  String input = '2025-03-11'; // 날짜 입력
  DateTime date = DateTime.parse(input); // 문자열을 날짜로 변환

  List<String> weekdays = ["월", "화", "수", "목", "금", "토", "일"]; // 내가 만든 요일 리스트
  String dayOfWeek = weekdays[date.weekday - 1]; // 1을 빼서 리스트의 인덱스에 맞추기

  print(dayOfWeek); // 날짜에 맞는 요일 출력
}
