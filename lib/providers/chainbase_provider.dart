import 'dart:convert';

import 'package:cli/models/models.dart';
import 'package:http/http.dart' as http;

class ChainbaseProvider {
  // @override
  // void onInit() {
  //   httpClient.baseUrl = 'https://api.chainbase.online/v1/';
  //   httpClient.timeout = const Duration(seconds: 300);
  //   httpClient.addRequestModifier((Request request) {
  //     request.headers['x-api-key'] = '2e1SXeXTKCmUPGWTmL0bMA0WEeQ';
  //     return request;
  //   });
  // }

  // Get top token holders
  Future<List<AddressWithBalanceM>> getTopTokenHolders({
    required int chainId,
    required String contractAddress,
    required int page,
  }) async {
    try {
      var client = http.Client();
      // final Map<String, String> queryParameters = {
      //   'chain_id': '$chainId',
      //   'contract_address': contractAddress,
      //   'page': '$page',
      //   'limit': '100',
      // };

      // print('queryParameters: $queryParameters');
      var uri = Uri.parse(
        'https://api.chainbase.online/v1/token/top-holders?chain_id=$chainId&contract_address=$contractAddress&page=$page&limit=100',
      );

      final response = await client.get(
        uri,
        headers: {
          'x-api-key': '2e1SXeXTKCmUPGWTmL0bMA0WEeQ',
        },
      );

      if (response.statusCode == 200) {
        // final List<AddressWithBalanceM> addressWithBalances = [];
        // final List<dynamic> data = json.decode(response.body)['data'];

        // for (var item in data) {
        //   addressWithBalances.add(
        //     AddressWithBalanceM(
        //       amount: item['amount'],
        //       address: item['wallet_address'],
        //     ),
        //   );
        // }

        // return addressWithBalances;
        final List<dynamic> data = json.decode(response.body)['data'];
        final tempList = List.from(data)
            .map((e) => ChainbaseM.fromJson(e))
            .toList();
        return AddressWithBalanceM.convertChainbaseToAddressWithBalance(
          tempList,
        );
      }

      throw Exception('ChainbaseM token/top-holders Error: ${response.body}');
    } catch (e) {
      print('ChainbaseM token/top-holders Error: $e');
      throw Exception('ChainbaseM token/top-holders Error: $e');
    }
  }
}

final chainbaseProvider = ChainbaseProvider();
