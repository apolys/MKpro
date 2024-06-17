import 'dart:ui';

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_image_button.dart';
import 'package:fast_app_base/screen/main/tab/checkin/tab/f_my_checkin.dart';
import 'package:fast_app_base/screen/main/tab/checkin/tab/f_my_checkout.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/s_setting.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_todays_discovery.dart';
import 'package:flutter/material.dart';

class CheckInFragment extends StatefulWidget {
  const CheckInFragment({super.key});

  @override
  State<CheckInFragment> createState() => _CheckInFragmenttState();
}

class _CheckInFragmenttState extends State<CheckInFragment> with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        backgroundColor: context.appColors.roundedLayoutBackground,
        pinned: true,
        //backgroundColor: AppColors.veryDarkGrey,//지금 바탕 화이트라 해놔야함 , 다크모드로 되면 안써도 됨
        actions: [
          ImageButton(
            imagePath: '$basePath/icon/stock_search.png',
            onTap: (){
              Nav.push(SearchStockScreen());
            },
          ),
          ImageButton(
            imagePath: '$basePath/icon/stock_calendar.png',
            onTap: (){
              context.showSnackbar('캘린더');
            },
          ),
          ImageButton(
            imagePath: '$basePath/icon/stock_settings.png',
            onTap: (){
              Nav.push(SettingScreen());
            },
          ),
          //Image.asset('$basePath/icon/stock_calendar.png',height: 26,width: 26,).p(10),
          //Image.asset('$basePath/icon/stock_settings.png',height: 26,width: 26,).p(10),

        ],
      ),
      SliverToBoxAdapter(child:
      Container(//컨테이너 넣어서 백그라운드 컬러 강제적용
        color: AppColors.veryDarkGrey,//지금 바탕 화이트라 해놔야함 , 다크모드로 되면 안써도 됨
        child: Column(children: [
          title,
          tabBar,
          if(currentIndex == 0)
            const MyCheckinFragment()
          else
            //const TodaysDiscoveryFragment()
            const MyCheckoutFragment()
        ],),
      ),
      ),
    ]);
  }
  Widget get title => Container(
    color: context.appColors.roundedLayoutBackground,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        '근태관리서비스'.text.size(24).bold.make(),
        width20,
        '출퇴근,휴가관리,시장조사'.text.bold.color(context.appColors.lessImportantText).make(),
      ],
    ).pOnly(left: 20),
  );
  Widget get tabBar => Container(
    color: context.appColors.roundedLayoutBackground,
    child: Column(
      children: [
        TabBar(
            onTap: (index){
              setState(() {
                currentIndex = index;
              });
            },
            labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelPadding: const EdgeInsets.symmetric(vertical: 20),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,//이건 내가 추가
            controller: tabController,
            tabs: [
              '출근'.text.make(),
              '퇴근'.text.make(),
            ])
      ],
    ),
  );
  Widget get myAccount => Placeholder();
  Widget get myStocks => Placeholder();

}

