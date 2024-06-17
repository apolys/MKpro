import 'dart:collection';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
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

class FirstFragment extends StatelessWidget {

  const FirstFragment({
    Key? key,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {

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
                  children: [
                    "To Do List".text.white.make(),
                    height5,
                    ...firstNotices.map((e) => FirstNoticeWidget(e)).toList(),
                  ],)),
                //
                // Line(color: context.appColors.divider,),
                // height10,
                //

                //
                // RoundedContainer(child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     "일정".text.white.make(),
                //     height5,
                //
                //
                //     TableCalendar(
                //       focusedDay: DateTime.now(),  // 현재 날짜를 기준으로 달력을 표시
                //       firstDay: DateTime(2020),    // 달력의 시작 날짜 설정
                //       lastDay: DateTime(2030),     // 달력의 마지막 날짜 설정
                //
                //       // selectedDayPredicate: (day) {
                //       //   return isSameDay(_selectedDay, day);
                //       // },
                //     ),
                //   ],)),
            
            ],).pSymmetric(h: 20)
                  .animate().slideY(duration:NumDurationExtension(2000).ms),
            ),
          ),
        const FirstAppBar()
        ],),
    );
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

