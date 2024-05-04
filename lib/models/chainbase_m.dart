import 'dart:convert';

class ChainbaseM {
  double? amount;
  double? usdValue;
  String? walletAddress;

  ChainbaseM({
    this.amount,
    this.usdValue,
    this.walletAddress,
  });

  ChainbaseM copyWith({
    double? amount,
    double? usdValue,
    String? walletAddress,
  }) =>
      ChainbaseM(
        amount: amount ?? this.amount,
        usdValue: usdValue ?? this.usdValue,
        walletAddress: walletAddress ?? this.walletAddress,
      );

  factory ChainbaseM.fromRawJson(String str) =>
      ChainbaseM.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChainbaseM.fromJson(Map<String, dynamic> json) {
    return ChainbaseM(
      amount: double.parse(json["amount"]),
      usdValue: double.parse(json["usd_value"]),
      walletAddress: json["wallet_address"],
    );
  }

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "usd_value": usdValue,
        "wallet_address": walletAddress,
      };
}
