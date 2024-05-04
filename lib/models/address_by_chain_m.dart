import 'package:cli/extensions/extensions.dart';

class AddressByChainM {
  ENetwork eNetwork;
  // ECovalenthqNetwork eCovalenthqNetwork;
  String address;

  AddressByChainM({
    required this.eNetwork,
    // required this.eCovalenthqNetwork,
    required this.address,
  });

  AddressByChainM copyWith({
    ENetwork? eNetwork,
    // // ECovalenthqNetwork? eCovalenthqNetwork,
    String? address,
  }) =>
      AddressByChainM(
        eNetwork: eNetwork ?? this.eNetwork,
        // // // eCovalenthqNetwork: eCovalenthqNetwork ?? this.eCovalenthqNetwork,
        address: address ?? this.address,
      );

  // factory AddressByChainM.fromRawJson(String str) =>
  //     AddressByChainM.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  // factory AddressByChainM.fromJson(Map<String, dynamic> json) =>
  //     AddressByChainM(
  //       chain: json["chain"],
  //       address: json["address"],
  //     );

  Map<String, dynamic> toJson() => {
        "eNetwork": eNetwork,
        // "eCovalenthqNetwork": eCovalenthqNetwork,
        "address": address,
      };
}
