import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:fast_app_base/screen/notification/vo/notification_type.dart';
//import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'vo/vo_notification.dart';
final notificationDummies = <TtossNotification>[
  TtossNotification(
    NotificationType.moneyTip,
    '주간업무일정을 등록해 주세요',
    DateTime.now().subtract(27.minutes),
  ),
  TtossNotification(
    NotificationType.moneyTip,
    '6월 휴가일정을 등록해 주세요.',
    DateTime.now().subtract(1.hours),
  ),
  TtossNotification(
    NotificationType.moneyTip,
    '출퇴근 누락 시 담당 팀장에게 연락 주시기 바랍니다.',
    DateTime.now().subtract(1.hours),
    isRead: true,
  ),
  TtossNotification(
    NotificationType.moneyTip,
    '6월 교육일정:6/11화 10-11시.',
    DateTime.now().subtract(8.hours),
    isRead: true,
  ),
];
