import 'package:cli/extensions/extensions.dart';
import 'package:cli/models/models.dart';

class AddressWithBalanceM {
  int amount;
  String address;

  AddressWithBalanceM({
    required this.amount,
    required this.address,
  });

  AddressWithBalanceM copyWith({
    int? amount,
    String? address,
  }) =>
      AddressWithBalanceM(
        amount: amount ?? this.amount,
        address: address ?? this.address,
      );

  // factory AddressWithBalanceMDart.fromRawJson(String str) => AddressWithBalanceMDart.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  // factory AddressWithBalanceMDart.fromJson(Map<String, dynamic> json) => AddressWithBalanceMDart(
  //     amount: json["amount"],
  //     address: json["address"],
  // );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "address": address,
      };

  static List<AddressWithBalanceM> convertChainbaseToAddressWithBalance(
    List<ChainbaseM> chainBases,
  ) {
    List<AddressWithBalanceM> addressWithBalances = [];

    for (var chainBase in chainBases) {
      addressWithBalances.add(AddressWithBalanceM(
        amount: chainBase.amount!.toInt(),
        address: chainBase.walletAddress!,
      ));
    }

    return addressWithBalances;
  }

  static List<AddressWithBalanceM> convertCovalenthqToAddressWithBalance(
    List<CovalenthqM> covalenthqs,
  ) {
    List<AddressWithBalanceM> addressWithBalances = [];

    for (var item in covalenthqs) {
      addressWithBalances.add(
        AddressWithBalanceM(
          amount: item.balance!.convertToDecimal(item.contractDecimals!),
          address: item.address!,
        ),
      );
    }

    return addressWithBalances;
  }

  static List<AddressWithBalanceM> convertTronNetworkToAddressWithBalance(
    List<TronNetworkM> tronNetworks,
  ) {
    List<AddressWithBalanceM> addressWithBalances = [];

    for (var item in tronNetworks) {
      addressWithBalances.add(
        AddressWithBalanceM(
          amount: item.amount!.convertToDecimal(6),
          address: item.address!,
        ),
      );
    }

    return addressWithBalances;
  }

  static List<AddressWithBalanceM> findDifferenceWithExcelItem(
    List<AddressWithBalanceM> addressWithBalances,
    List<ExcelItemRowM> arrayExcel,
  ) {
    List<AddressWithBalanceM> differenceListResult = [];

    for (var item in addressWithBalances) {
      bool found = false;

      for (var excelItem in arrayExcel) {
        var excelAddress = excelItem.address;
        if (item.address.toLowerCase() == excelAddress!.toLowerCase()) {
          found = true;
          break;
        }
      }

      if (!found) {
        differenceListResult.add(item);
      }
    }

    return differenceListResult;
  }

  static List<AddressWithBalanceM> mergeDuplicateAddresses(
    List<AddressWithBalanceM> addressWithBalances,
  ) {
    Map<String, AddressWithBalanceM> uniqueAddresses = {};

    for (var item in addressWithBalances) {
      String address = item.address;
      int amount = item.amount;

      if (uniqueAddresses.containsKey(address)) {
        uniqueAddresses[address]!.amount =
            uniqueAddresses[address]!.amount + amount;
      } else {
        uniqueAddresses[address] = item;
      }
    }

    return uniqueAddresses.values.toList();
  }
}
