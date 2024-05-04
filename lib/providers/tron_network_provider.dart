import 'dart:convert';

import 'package:cli/models/models.dart';
import 'package:http/http.dart' as http;

class TronNetworkProvider {
  // @override
  // void onInit() {
  //   httpClient.baseUrl = 'https://api.trongrid.io/v1/';
  //   httpClient.timeout = const Duration(seconds: 30);
  //   httpClient.addRequestModifier((Request request) {
  //     request.headers['TRON-PRO-API-KEY'] =
  //         '5920e0b3-8a75-4dba-a108-de0027bf573c';
  //     return request;
  //   });
  // }

  Future<List<AddressWithBalanceM>> getTopTokenHolders({
    required String tokenAddress,
    // String? fingerprint,
  }) async {
    try {
      var client = http.Client();
      // final Map<String, dynamic> queryParameters = {
      //   'order_by': 'balance,desc',
      //   'limit': '200',
      // };

      // final endPoint = 'contracts/$tokenAddress/tokens';
      // print('endPoint: $endPoint');
      var uri = Uri.parse(
        'https://api.trongrid.io/v1/contracts/$tokenAddress/tokens?order_by=balance,desc&limit=200',
      );

      final response = await client.get(
        uri,
        headers: {
          'TRON-PRO-API-KEY': '5920e0b3-8a75-4dba-a108-de0027bf573c',
        },
      );
      // debugPrint('resp: $resp');

      // if (resp.isOk && resp.body != null && resp.body['data'] != null) {
      //   final data = List.from(resp.body['data']).map((e) {
      //     return TronNetworkM.fromJson(e);
      //   }).toList();
      //   return AddressWithBalanceM.convertTronNetworkToAddressWithBalance(data);
      // }

      if (response.statusCode == 200) {
        final data = List.from(json.decode(response.body)['data']).map((e) {
          return TronNetworkM.fromJson(e);
        }).toList();
        return AddressWithBalanceM.convertTronNetworkToAddressWithBalance(data);
      }

      throw Exception(
          'TronNetworkProvider getTopTokenHolders Error: ${response.body}');
    } catch (e) {
      print('TronNetworkProvider getTopTokenHolders Error: $e');
      rethrow;
    }
  }
}

final tronNetworkProvider = TronNetworkProvider();