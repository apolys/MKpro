import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/first/vo/vo_first_notice.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';
import 'package:flutter/material.dart';

class FirstNoticeWidget extends StatelessWidget {
  //final BankAccount account;
  final FirstNotice account;



  const FirstNoticeWidget(this.account, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (account.firstCountNo).text.white.size(12).make(),
        // Image.asset(
        //   account.bank.logoImagePath,
        //   width: 40,
        // ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (account.firstName)
                  .text
                  .white
                  .size(12)
                  .make(),
            ],
          ).pSymmetric(h: 20, v: 10),
        ),
        //Button
        RoundedContainer(
          backgroundColor: context.appColors.buttonBackground,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          radius: 10,
          child: "확인".text.white.bold.make(),

        ),
      ],
    );
  }
}
