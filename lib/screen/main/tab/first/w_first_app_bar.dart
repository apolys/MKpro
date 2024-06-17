import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TtossAppBar extends StatefulWidget {
  static const double appBarHeight = 60;
  const TtossAppBar({super.key});

  @override
  State<TtossAppBar> createState() => _TtossAppBarState();
}

class _TtossAppBarState extends State<TtossAppBar> {
  bool _showRedDot = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TtossAppBar.appBarHeight,
      color: context.appColors.appBarBackgraound,
      child: SingleChildScrollView(
        child: Row(
          children: [
            width10,
            Image.asset(
              "$basePath/icon/toss.png",
              height: 30,
            ),
            EmptyExpanded(),
            //Expanded(child: Container()),
            Image.asset(
              "$basePath/icon/map_point.png",
              height: 30,
            ),
            width10,

            Tap(
              onTap: (){
                //알림 화면
                Nav.push(NotificationScreen());
              },
              child: Stack(
                children: [
                  Image.asset(
                    "$basePath/icon/notification.png",
                    height: 30,
                  ),
                  if(_showRedDot)Positioned.fill(
                      child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration( shape: BoxShape.circle, color: Colors.red),
                    ),
                  ))else Positioned.fill(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration( shape: BoxShape.circle, color: Colors.blue),
                        ),
                      )),
                ],
              ).animate()
                  .shake(duration: 2000.ms, hz:3 ),
            ),
            width10,
          ],
        ),
      ),
    );
  }
}
