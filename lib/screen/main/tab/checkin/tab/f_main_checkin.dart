import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_long_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/call/f_plan.dart';
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

        SingleChildScrollView(

          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DataTable(

                  columns: const [
                    DataColumn(label: Text('9')),
                    DataColumn(label: Text('10')),
                    DataColumn(label: Text('11')),
                    DataColumn(label: Text('12')),
                    DataColumn(label: Text('13')),
                    DataColumn(label: Text('14')),
                    DataColumn(label: Text('15')),
                  ],
                  rows: const [
                    DataRow(cells: [
                    DataCell(Text('')),
                    DataCell(Text('출근')),
                    DataCell(Text('출근')),
                    DataCell(Text('출근')),
                    DataCell(Text('출근')),
                    DataCell(Text('연차')),
                    DataCell(Text('')),
                    ]),
                  ]
              )
            ],
          ),
        ),
        height10,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            '오늘방문'.text.size(24).bold.make(),
            Arrow(),
            emptyExpanded,

          ],
        ),
        height10,

        SingleChildScrollView(

          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DataTable(

                  columns: const [
                    DataColumn(label: Text('1')),
                    DataColumn(label: Text('2')),
                    DataColumn(label: Text('3')),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('방문전')),
                      DataCell(Text('방문')),
                      DataCell(Text('방문')),
                    ]),
                  ]
              )
            ],
          ),
        ),
        height10,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            '요청사항'.text.size(24).bold.make(),
            Arrow(),
            emptyExpanded,

          ],
        ),
        height10,

        SingleChildScrollView(

          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DataTable(

                  columns: const [
                    DataColumn(label: Text('1')),
                    DataColumn(label: Text('2')),
                    DataColumn(label: Text('3')),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('방문전')),
                      DataCell(Text('방문')),
                      DataCell(Text('방문')),
                    ]),
                  ]
              )
            ],
          ),
        ),

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
            // height30,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     '관심주식'.text.bold.make(),
            //     //emptyExpanded,
            //     '편집하기'.text.color(context.appColors.lessImportantText).make(),
            //   ],
            // ),
            height20,
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
