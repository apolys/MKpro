import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import './vo/vo_notification.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItemWidget extends StatefulWidget {
  final TtossNotification notification;
  final VoidCallback onTap;

  const NotificationItemWidget({required this.onTap, super.key, required this.notification});

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  static const double leftPadding = 10;
  static const double iconWidth = 25;

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color:  widget.notification.isRead? context.appColors.roundedLayoutBackground : context.appColors.unreadColor,//backgroundColor 현재 화이트
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Width(leftPadding),
                Image.asset(
                  widget.notification.type.iconPath,
                  width: iconWidth,
                ),
                widget.notification.type.name.text.size(12).color(context.appColors.lessImportantText).make(),
                emptyExpanded, //왜인지 빨간불켜짐
                timeago.format(widget.notification.time, locale: context.locale.languageCode).text.size(13).color(context.appColors.lessImportantText).make(),
                width10,
              ],
            ),
              widget.notification.description.text.size(12).color(context.appColors.textBadgeText).make().
              pOnly(left: leftPadding+iconWidth)
            //widget.notification.description.text.make().pOnly(left: 35)//위에것은 글씨 잘 안보여서 화이트색 처리
          ],
        ),
      ),
    );
  }
}
