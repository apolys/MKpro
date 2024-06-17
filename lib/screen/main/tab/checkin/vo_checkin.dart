import 'dart:ui';

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/checkin/vo_popular_checkin.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_popular_stock.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Checkin extends PopularCheckin {
  final String stockImagePath;

  Checkin(
      {required this.stockImagePath,
        required super.yesterdayClosePrice,
        required super.currentPrice,
        required super.stockName,
        required super.lastdate
      });
//
// double get todayPercentage => ((currentPrice - yesterdayClosePrice)/ yesterdayClosePrice*100).toPrecision(2);
//
// String get todayPercentageString =>"$sysbol$todayPercentage%";
//
// bool get isPlus => currentPrice > yesterdayClosePrice;
// bool get isSame => currentPrice == yesterdayClosePrice;
// bool get isMinus => currentPrice < yesterdayClosePrice;
//
// String get sysbol => isSame ? "" : isPlus ? "+" : "-";
//
// Color getPriceColor(BuildContext context) => isSame ? context.appColors.lessImportantText : isPlus ? context.appColors.plus : context.appColors.minus;
}
