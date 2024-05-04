// import 'dart:convert';


import 'package:cli/models/models.dart';

class MyTokenM {
  String name;
  List<AddressByChainM> chains;
  int minBalance;
  // String address;
  // int maxPageGetChainbase;

  MyTokenM({
    required this.name,
    required this.chains,
    required this.minBalance,
    // required this.address,
    // required this.maxPageGetChainbase,
  });

  MyTokenM copyWith({
    String? name,
    List<AddressByChainM>? chains,
    int? minBalance,
    // String? address,
    // int? maxPageGetChainbase,
  }) =>
      MyTokenM(
        name: name ?? this.name,
        chains: chains ?? this.chains,
        minBalance: minBalance ?? this.minBalance,
        // address: address ?? this.address,
        // // // maxPageGetChainbase: maxPageGetChainbase ?? this.maxPageGetChainbase,
      );

  // factory MyTokenM.fromRawJson(String str) =>
  //     MyTokenM.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  // factory MyTokenM.fromJson(Map<String, dynamic> json) => MyTokenM(
  //       name: json["name"],
  //       chains: json["chains"] == null
  //           ? []
  //           : List<int>.from(json["chains"]!.map((x) => x)),
  //       minBalance: json["min_balance"],
  //       address: json["address"],
  // maxPageGetChainbase: json["max_page_get_chainbase"],
  //     );

  Map<String, dynamic> toJson() => {
        "name": name,
        "chains": List<dynamic>.from(chains.map((x) => x.toJson())),
        "min_balance": minBalance,
        // "address": address,
        // "max_page_get_chainbase": maxPageGetChainbase,
      };
}
