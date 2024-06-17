import 'vo_bank.dart';

class FirstNotice {
  final Bank bank;
  int balance;
  // ignore: non_constant_identifier_names
  final String firstCountNo;
  final String firstName;
  final String? accountTypeName;

  FirstNotice(
    this.bank,
    this.balance,
      this.firstCountNo,
      this.firstName,
      {
    this.accountTypeName,
  });
}
