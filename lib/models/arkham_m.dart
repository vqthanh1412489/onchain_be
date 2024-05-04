import 'dart:convert';

class ArkhamM {
  Address? address;
  double? balance;
  double? usd;
  double? pctOfCap;

  ArkhamM({
    this.address,
    this.balance,
    this.usd,
    this.pctOfCap,
  });

  ArkhamM copyWith({
    Address? address,
    double? balance,
    double? usd,
    double? pctOfCap,
  }) =>
      ArkhamM(
        address: address ?? this.address,
        balance: balance ?? this.balance,
        usd: usd ?? this.usd,
        pctOfCap: pctOfCap ?? this.pctOfCap,
      );

  factory ArkhamM.fromRawJson(String str) =>
      ArkhamM.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArkhamM.fromJson(Map<String, dynamic> json) => ArkhamM(
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        balance: json["balance"]?.toDouble(),
        usd: json["usd"]?.toDouble(),
        pctOfCap: json["pctOfCap"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "balance": balance,
        "usd": usd,
        "pctOfCap": pctOfCap,
      };

  List<ArkhamM> mergeDuplicateAddresses(List<ArkhamM> addresses) {
    Map<String, ArkhamM> uniqueAddresses = {};

    for (var addressObj in addresses) {
      String address = addressObj.address!.address!;
      double balance = addressObj.balance!;

      if (uniqueAddresses.containsKey(address)) {
        uniqueAddresses[address]!.balance =
            uniqueAddresses[address]!.balance! + balance;
      } else {
        uniqueAddresses[address] = addressObj;
      }
    }

    return uniqueAddresses.values.toList();
  }
}

class Address {
  String? address;
  String? chain;
  ArkhamEntity? arkhamEntity;
  ArkhamLabel? arkhamLabel;
  bool? isUserAddress;
  bool? contract;

  Address({
    this.address,
    this.chain,
    this.arkhamEntity,
    this.arkhamLabel,
    this.isUserAddress,
    this.contract,
  });

  Address copyWith({
    String? address,
    String? chain,
    ArkhamEntity? arkhamEntity,
    ArkhamLabel? arkhamLabel,
    bool? isUserAddress,
    bool? contract,
  }) =>
      Address(
        address: address ?? this.address,
        chain: chain ?? this.chain,
        arkhamEntity: arkhamEntity ?? this.arkhamEntity,
        arkhamLabel: arkhamLabel ?? this.arkhamLabel,
        isUserAddress: isUserAddress ?? this.isUserAddress,
        contract: contract ?? this.contract,
      );

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        chain: json["chain"],
        arkhamEntity: json["arkhamEntity"] == null
            ? null
            : ArkhamEntity.fromJson(json["arkhamEntity"]),
        arkhamLabel: json["arkhamLabel"] == null
            ? null
            : ArkhamLabel.fromJson(json["arkhamLabel"]),
        isUserAddress: json["isUserAddress"],
        contract: json["contract"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "chain": chain,
        "arkhamEntity": arkhamEntity?.toJson(),
        "arkhamLabel": arkhamLabel?.toJson(),
        "isUserAddress": isUserAddress,
        "contract": contract,
      };
}

class ArkhamEntity {
  String? name;
  String? note;
  String? id;
  String? type;
  dynamic service;
  dynamic addresses;
  String? website;
  String? twitter;
  String? crunchbase;

  ArkhamEntity({
    this.name,
    this.note,
    this.id,
    this.type,
    this.service,
    this.addresses,
    this.website,
    this.twitter,
    this.crunchbase,
  });

  ArkhamEntity copyWith({
    String? name,
    String? note,
    String? id,
    String? type,
    dynamic service,
    dynamic addresses,
    String? website,
    String? twitter,
    String? crunchbase,
  }) =>
      ArkhamEntity(
        name: name ?? this.name,
        note: note ?? this.note,
        id: id ?? this.id,
        type: type ?? this.type,
        service: service ?? this.service,
        addresses: addresses ?? this.addresses,
        website: website ?? this.website,
        twitter: twitter ?? this.twitter,
        crunchbase: crunchbase ?? this.crunchbase,
      );

  factory ArkhamEntity.fromRawJson(String str) =>
      ArkhamEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArkhamEntity.fromJson(Map<String, dynamic> json) => ArkhamEntity(
        name: json["name"],
        note: json["note"],
        id: json["id"],
        type: json["type"],
        service: json["service"],
        addresses: json["addresses"],
        website: json["website"],
        twitter: json["twitter"],
        crunchbase: json["crunchbase"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "note": note,
        "id": id,
        "type": type,
        "service": service,
        "addresses": addresses,
        "website": website,
        "twitter": twitter,
        "crunchbase": crunchbase,
      };
}

class ArkhamLabel {
  String? name;
  String? address;
  String? chainType;

  ArkhamLabel({
    this.name,
    this.address,
    this.chainType,
  });

  ArkhamLabel copyWith({
    String? name,
    String? address,
    String? chainType,
  }) =>
      ArkhamLabel(
        name: name ?? this.name,
        address: address ?? this.address,
        chainType: chainType ?? this.chainType,
      );

  factory ArkhamLabel.fromRawJson(String str) =>
      ArkhamLabel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArkhamLabel.fromJson(Map<String, dynamic> json) => ArkhamLabel(
        name: json["name"],
        address: json["address"],
        chainType: json["chainType"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "chainType": chainType,
      };
}
