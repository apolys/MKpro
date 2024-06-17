import 'package:fast_app_base/screen/main/notification/vo/notification_type.dart';

class Notification{

  final NotificationType type;
  final String description;
  final DateTime time;

  Notification(this.type, this.description, this.time);
}