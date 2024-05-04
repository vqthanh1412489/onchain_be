import 'dart:convert';

class TronNetworkM {
  String? address;
  String? amount;

  TronNetworkM({
    this.address,
    this.amount,
  });

  TronNetworkM copyWith({
    String? address,
    String? amount,
  }) =>
      TronNetworkM(
        address: address ?? this.address,
        amount: amount ?? this.amount,
      );

  factory TronNetworkM.fromRawJson(String str) =>
      TronNetworkM.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  // factory TronNetworkM.fromJson(Map<String, dynamic> json) => TronNetworkM(
  //       address: json["address"],
  //       amount: json["amount"],
  //     );
  factory TronNetworkM.fromJson(Map<String, dynamic> json) {
    return TronNetworkM(
      address: json.keys.first,
      amount: json.values.first,
    );
  }

  Map<String, dynamic> toJson() => {
        "address": address,
        "amount": amount,
      };
}
