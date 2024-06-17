import 'package:fast_app_base/screen/main/tab/call/widgets/daily_sheet.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;

// MainCalendar 생성자
  const MainCalendar({super.key,
    required this.onDaySelected, // 날짜 선택 시 호출될 콜백 함수
    required this.selectedDate, // 현재 선택된 날짜
  });

  // @override
  // void initState() {
  //   super.initState();
  //   date = widget.selectedDate;
  // }

  @override
  Widget build(BuildContext context) {
// TableCalendar 위젯을 사용하여 달력을 표시
    return TableCalendar(
      onDaySelected: (selectedDate, focusedDate) {
        // DiarySheet 화면으로 이동하는 내비게이션을 수행
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DiarySheet(selectedDate: selectedDate),
          ),
        );
      },
      // 날짜 선택 시 호출될 콜백 함수 설정
      selectedDayPredicate: (date) {
// 선택된 날짜와 현재 날짜가 같은지 확인하여 선택된 날짜를 표시
        return isSameDay(selectedDate, date);
      },
      focusedDay: DateTime.now(),
      // 현재 날짜를 기준으로 달력을 표시
      firstDay: DateTime(2020),
      // 달력의 시작 날짜 설정
      lastDay: DateTime(2030), // 달력의 마지막 날짜 설정
    );
  }
}
