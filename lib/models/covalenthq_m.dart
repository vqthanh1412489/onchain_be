import 'dart:convert';

class CovalenthqM {
  int? contractDecimals;
  String? contractName;
  String? contractTickerSymbol;
  String? contractAddress;
  String? logoUrl;
  String? address;
  String? balance;
  String? totalSupply;
  int? blockHeight;

  CovalenthqM({
    this.contractDecimals,
    this.contractName,
    this.contractTickerSymbol,
    this.contractAddress,
    this.logoUrl,
    this.address,
    this.balance,
    this.totalSupply,
    this.blockHeight,
  });

  CovalenthqM copyWith({
    int? contractDecimals,
    String? contractName,
    String? contractTickerSymbol,
    String? contractAddress,
    String? logoUrl,
    String? address,
    String? balance,
    String? totalSupply,
    int? blockHeight,
  }) =>
      CovalenthqM(
        contractDecimals: contractDecimals ?? this.contractDecimals,
        contractName: contractName ?? this.contractName,
        contractTickerSymbol: contractTickerSymbol ?? this.contractTickerSymbol,
        contractAddress: contractAddress ?? this.contractAddress,
        logoUrl: logoUrl ?? this.logoUrl,
        address: address ?? this.address,
        balance: balance ?? this.balance,
        totalSupply: totalSupply ?? this.totalSupply,
        blockHeight: blockHeight ?? this.blockHeight,
      );

  factory CovalenthqM.fromRawJson(String str) =>
      CovalenthqM.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CovalenthqM.fromJson(Map<String, dynamic> json) => CovalenthqM(
        contractDecimals: json["contract_decimals"],
        contractName: json["contract_name"],
        contractTickerSymbol: json["contract_ticker_symbol"],
        contractAddress: json["contract_address"],
        logoUrl: json["logo_url"],
        address: json["address"],
        balance: json["balance"],
        totalSupply: json["total_supply"],
        blockHeight: json["block_height"],
      );

  Map<String, dynamic> toJson() => {
        "contract_decimals": contractDecimals,
        "contract_name": contractName,
        "contract_ticker_symbol": contractTickerSymbol,
        "contract_address": contractAddress,
        "logo_url": logoUrl,
        "address": address,
        "balance": balance,
        "total_supply": totalSupply,
        "block_height": blockHeight,
      };
}
