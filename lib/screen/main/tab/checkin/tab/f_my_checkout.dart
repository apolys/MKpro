import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_long_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/checkin/tab/w_daily_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_interest_stock_list.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/w_height_and_width.dart';

class MyCheckinFragment extends StatelessWidget {
  const MyCheckinFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getMyCheckin(context),
        height20,
        getMyCheckinResult(context),
      ],
    );
  }

  Widget getMyCheckin(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    color: context.appColors.roundedLayoutBackground,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height20,
        '상태'.text.make(),
        Row(
          children: [
            '출근 전'.text.size(24).bold.make(),
            Arrow(),
            emptyExpanded,
            // RoundedContainer(
            //   child:
            //   '출근하기'.text.size(20).make(),
            //   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            //   radius: 8,
            //   backgroundColor: context.appColors.divider,
            // ),

            ElevatedButton(
              onPressed: () {
                print('submit'); // ElevatedButton 클릭 시 콘솔에 'submit' 출력
                context.showSnackbar("출근완료");
              },
              child: const Text('출근하기',style: TextStyle(
                fontSize: 30,)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16.0),
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey,
                // button의 모서리 둥근 정도를 바꿀 수 있음
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0.0,
              ),
              // 버튼에 표시될 텍스트 설정
            ),
          ],
        ),
        height30,
        Line(color: context.appColors.divider,),
        height10,
        LongButton(title: '주간Plan'),
        LongButton(title: '주간Actual'),
      ],
    ),
  );

  Widget getMyCheckinResult(BuildContext context) => Column(
    children: [
      Container(
        //padding: const EdgeInsets.symmetric(horizontal: 20),
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          children: [
            height30,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     '관심주식'.text.bold.make(),
            //     //emptyExpanded,
            //     '편집하기'.text.color(context.appColors.lessImportantText).make(),
            //   ],
            // ),
            // height20,
            Tap(
              onTap: (){
                context.showSnackbar('방문결과');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    '방문결과'.text.size(18).bold.make(),
                    Arrow(direction: AxisDirection.up,
                    ),
                  ],),
              ),
            ),

          ],
        ),
      ),
      DailyList().pSymmetric(h: 20, v: 30),
    ],
  );
}
