import 'dart:convert';

class ExcelItemRowM {
  String? name;
  String? type;
  String? address;
  // double? balance;
  // double? usd;
  // double? pctOfCap;
  // int? fromColumn;

  ExcelItemRowM({
    this.name,
    this.type,
    this.address,
    // this.balance,
    // this.usd,
    // this.pctOfCap,
    // this.fromColumn,
  });

  ExcelItemRowM copyWith({
    String? name,
    String? type,
    String? address,
    // double? balance,
    // double? usd,
    // double? pctOfCap,
    // int? fromColumn,
  }) =>
      ExcelItemRowM(
        name: name ?? this.name,
        type: type ?? this.type,
        address: address ?? this.address,
        // balance: balance ?? this.balance,
        // usd: usd ?? this.usd,
        // pctOfCap: pctOfCap ?? this.pctOfCap,
        // // // fromColumn: fromColumn ?? this.fromColumn,
      );

  factory ExcelItemRowM.fromRawJson(String str) =>
      ExcelItemRowM.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExcelItemRowM.fromJson(Map<String, dynamic> json) => ExcelItemRowM(
      // name: json["Name"] ?? '-' ,
      // type: json["type"] ?? '-',
      // address: json["Address"],
      // balance: double.parse(json["balance"].toString()),
      // balances: json["balances"] != null
      //     ? List<BalanceM>.from(
      //         json["balances"].map((x) => BalanceM.fromJson(x)))
      //     : [],
      // usd: json["usd"]?.toDouble(),
      // pctOfCap: json["pctOfCap"]?.toDouble(),
      // fromColumn: json.length + 1,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "address": address,
        // "balance": balance,
        // "usd": usd,
        // "pctOfCap": pctOfCap,
        // // "fromColumn": fromColumn,
      };
}
