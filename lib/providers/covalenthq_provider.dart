// import 'package:arkham_excel/app/models/models.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// // import 'package:get/get_connect/http/src/request/request.dart';

// class CovalenthqProvider extends GetConnect {
//   @override
//   void onInit() {
//     httpClient.baseUrl = 'https://api.covalenthq.com/v1/';
//     httpClient.timeout = const Duration(seconds: 300);
//     // httpClient.addRequestModifier((Request request) {
//     //   request.headers['Content-Type'] = 'application/json';
//     //   request.headers['Accept'] = '*/*';
//     //   request.headers['Connection'] = 'keep-alive';
//     //   return request;
//     // });
//   }

//   // Get top token holders
//   Future<List<AddressWithBalanceM>> getTopTokenHolders({
//     required String chainName,
//     required String tokenAddress,
//     required int pageNumber,
//     String? date,
//   }) async {
//     try {
//       // final Map<String, dynamic> queryParameters = {
//       //   'page-number': (pageNumber - 1).toString(),
//       //   'page-size': '100',
//       //   'key': 'cqt_rQyf3B49dYW74kPfbbGhVtX3VwwW',
//       //   // 'date': '2024-03-25',
//       // };

//       final endPoint =
//           '$chainName/tokens/$tokenAddress/token_holders_v2/?key=cqt_rQyf3B49dYW74kPfbbGhVtX3VwwW&page-number=$pageNumber&page-size=100&date=$date';

//       // debugPrint('queryParameters: $queryParameters');
//       debugPrint('endPoint: $endPoint');

//       final resp = await get(endPoint);
//       // debugPrint('resp: $resp');

//       if (resp.isOk && resp.body != null) {
//         final data = List.from(resp.body['data']['items'])
//             .map((e) => CovalenthqM.fromJson(e))
//             .toList();
//         return AddressWithBalanceM.convertCovalenthqToAddressWithBalance(data);
//       }

//       throw Exception('CovalenthqM token/top-holders Error: ${resp.body}');
//     } catch (e) {
//       // debugPrint('CovalenthqM token/top-holders Error: $e');
//       throw Exception('CovalenthqM token/top-holders Error: $e');
//     }
//   }
// }
