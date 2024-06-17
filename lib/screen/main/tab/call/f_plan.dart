import 'dart:collection';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/call/schedule/colors.dart';
import 'package:fast_app_base/screen/main/tab/call/schedule/input_pop_1.dart';
import 'package:fast_app_base/screen/main/tab/call/schedule/schedule_bottom_sheet.dart';
import 'package:fast_app_base/screen/main/tab/call/schedule/schedule_card.dart';
import 'package:fast_app_base/screen/main/tab/call/schedule/today_banner.dart';
import 'package:fast_app_base/screen/main/tab/call/schedule/verhicle_card.dart';
import 'package:fast_app_base/screen/main/tab/call/widgets/daily_sheet.dart';
import 'package:fast_app_base/screen/main/tab/call/widgets/main_calendar.dart';
import 'package:fast_app_base/screen/main/tab/first/first_notice_dummy.dart';
import 'package:fast_app_base/screen/main/tab/first/vo/w_first_notice.dart';
import 'package:fast_app_base/screen/main/tab/first/w_first_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/w_bank_account.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttoss_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:live_background/widget/live_background_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';
import '../../../notification/s_notification_2.dart';


class Event {
  final DateTime date ;
  Event({required this.date});
}

class CallFragment extends StatefulWidget {

  const CallFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<CallFragment> createState() => _CallFragmentState();
}

class _CallFragmentState extends State<CallFragment> {

  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override

  Widget build(BuildContext context) {

    // 현재 디바이스의 스크린 너비와 높이 값을 가져옴
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(

      color: Colors.black,
      child: Stack(children: [

          //const LiveBackgroundWidget(),
          RefreshIndicator(
            edgeOffset: FirstAppBar.appBarHeight,
            onRefresh: () async{
              await sleepAsync(NumDurationExtension(500).ms);

            },
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: FirstAppBar.appBarHeight, bottom: MainScreenState.bottomNavigatorHeight),
              child: Column(children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    '근태관리서비스'.text.size(24).bold.make(),
                    width20,
                    '출퇴근,휴가관리,시장조사'.text.bold.color(context.appColors.lessImportantText).make(),
                  ],
                ).pOnly(left: 20),
                height10,
                Line(color: context.appColors.divider,),
                height10,

                RoundedContainer(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // width: screenWidth * 0.9,  // 화면 너비의 90%로 설정
                  // height: screenHeight * 0.7, // 화면 높이의 70%로 설정
                  children: [
                    MainCalendar(
                      selectedDate: selectedDate, // MainCalendar에 현재 선택된 날짜 전달
                      onDaySelected: onDaySelected, // MainCalendar에서 날짜 선택 시 호출될 콜백 함수 설정
                    )

                  ],)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    '휴가현황'.text.size(20).bold.make(),
                    width20,width20,width20,width20,width20,width20,width20,
                    '추가'.text.size(15).bold.color(context.appColors.lessImportantText).make(),

                    IconButton(
                        onPressed: (){
                          // showModalBottomSheet(
                          //   context: context,
                          //   isDismissible:true ,
                          //   builder: (_) => ScheduleBottomSheet(),
                          //   isScrollControlled: true,
                          // );
                          print('popup');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DiarySheet(selectedDate: selectedDate)),
                          );

                        },
                        icon: Icon(Icons.add_box_outlined,size: 40,)),

                  ],
                ).pOnly(left: 20),


                const SizedBox(height: 8,),
                TodayBanner(selectedDate: selectedDate, count: 1),
                height10,
                // const ScheduleCard(
                //   startTime: 12,
                //   endTime: 15,
                //   content: '일정을 샘플로 만들자',
                // ),
                const VerhicleCard(
                  startTime: 12,
                  endTime: 15,
                  targetDate: '6/5',
                  targetType: '연차',
                  content: '개인사유',
                ),

            ],).pSymmetric(h: 20)
                  .animate().slideY(duration:NumDurationExtension(2000).ms),
            ),

          ),
        const FirstAppBar(),



        ],),
    );


  }

// MainCalendar에서 호출되는 콜백 함수로, 선택된 날짜를 업데이트
  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

  void showSnackbar(BuildContext context) {
    context.showSnackbar('snackbar 입니다.',
        extraButton: Tap(
          onTap: () {
            context.showErrorSnackbar('error');
          },
          child: '에러 보여주기 버튼'
              .text
              .white
              .size(13)
              .make()
              .centered()
              .pSymmetric(h: 10, v: 5),
        ));
  }

  Future<void> showConfirmDialog(BuildContext context) async {
    final confirmDialogResult = await ConfirmDialog(
      '오늘 기분이 좋나요?',
      buttonText: "네",
      cancelButtonText: "아니오",
    ).show();
    debugPrint(confirmDialogResult?.isSuccess.toString());

    confirmDialogResult?.runIfSuccess((data) {
      ColorBottomSheet(
        '❤️',
        context: context,
        backgroundColor: Colors.yellow.shade200,
      ).show();
    });

    confirmDialogResult?.runIfFailure((data) {
      ColorBottomSheet(
        '❤️힘내여',
        backgroundColor: Colors.yellow.shade300,
        textColor: Colors.redAccent,
      ).show();
    });
  }

  Future<void> showMessageDialog() async {
    final result = await MessageDialog("안녕하세요").show();
    debugPrint(result.toString());
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}



