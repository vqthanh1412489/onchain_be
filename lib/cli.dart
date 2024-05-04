import 'package:cli/constants/constants.dart';
import 'package:cli/extensions/extensions.dart';
import 'package:cli/models/models.dart';
import 'package:cli/providers/providers.dart';
import 'package:cli/services/telegram_services.dart';
import 'package:cli/utils/utils.dart';
import 'package:gsheets/gsheets.dart';
import 'package:intl/intl.dart';

final gsheets = GSheets(googleSheetCredentials);
int fromColumn = 0;
bool isAdressTestVisible = false;
late Spreadsheet spreadsheet;

EProvider currentProvider = EProvider.Chainbase;
DateTime _selectedDate = DateTime.now();

Future<void> initGoogleSheet() async {
  spreadsheet = await gsheets.spreadsheet(googleSheetSpreadsheetId);
}

Future<List<ExcelItemRowM>> getAll(Worksheet sheet) async {
  final allRows = await sheet.values.map.allRows(fromRow: 2);
  fromColumn = allRows![0].entries.length + 1;
  return allRows.map((e) {
    return ExcelItemRowM(
      address: e.values.elementAt(1),
    );
  }).toList();
}

Future<void> addBalanceViaDay({
  required Worksheet sheet,
  List<AddressWithBalanceM> differenceList = const [],
  required int excelItemRowsLength,
  required List<String> insertDataColumns,
}) async {
  await sheet.values.insertValue(
    _selectedDate.toFormattedString(),
    column: fromColumn,
    row: 1,
  );

  if (insertDataColumns.isNotEmpty) {
    await sheet.values
        .insertColumns(fromColumn, [insertDataColumns], fromRow: 2);
  }

  if (differenceList.isNotEmpty) {
    final result = differenceList.map((e) {
      return insertZeroAfterAddress(
        [
          _selectedDate.toString(),
          e.address,
          e.amount.toString(),
        ],
        fromColumn - 3,
        e.address,
      );
    }).toList();

    await sheet.values.insertRows(
      excelItemRowsLength + 2,
      result,
      fromColumn: 1,
    );
  }
}

Future<void> loadData({
  required List<AddressWithBalanceM> chainBases,
  required List<ExcelItemRowM> excelItemRows,
  required MyTokenM myToken,
  required Worksheet sheet,
}) async {
  List<String> insertDataColumns = [];

  final mergedData = AddressWithBalanceM.mergeDuplicateAddresses(chainBases);
  final filteredData = mergedData
      .where((element) => element.amount >= myToken.minBalance)
      .toList();

  final differenceList = AddressWithBalanceM.findDifferenceWithExcelItem(
    filteredData,
    excelItemRows,
  );

  for (var excelItemRow in excelItemRows) {
    final item = filteredData.firstWhere(
      (e) => excelItemRow.address!.toLowerCase() == e.address.toLowerCase(),
      orElse: () => AddressWithBalanceM(amount: 0, address: ''),
    );
    if (item.address.isNotEmpty) {
      if (isAdressTestVisible) {
        insertDataColumns
            .add('${item.address.formatAddressString()}/${item.amount}');
      } else {
        insertDataColumns.add(item.amount.toString());
      }
    } else {
      insertDataColumns.add('0');
    }
  }

  await addBalanceViaDay(
    sheet: sheet,
    differenceList: differenceList,
    excelItemRowsLength: excelItemRows.length,
    insertDataColumns: insertDataColumns,
  );

  print('loadData ${myToken.name} done');
}

Future<void> onExportTopHolderByDay(MyTokenM item) async {
  try {
    final Worksheet sheet;
    sheet = spreadsheet.worksheetByTitle(item.name)!;
    final excelItemRows = await getAll(sheet);

    List<AddressWithBalanceM> temp = [];

    for (int indexChain = 0; indexChain < item.chains.length; indexChain++) {
      final chain = item.chains[indexChain];
      if (chain.eNetwork == ENetwork.Tron) {
        final resp = await tronNetworkProvider.getTopTokenHolders(
          tokenAddress: chain.address,
        );
        temp.addAll(resp);
        continue;
      }

      int page = currentProvider == EProvider.Chainbase ? 1 : 0;
      bool shouldContinue = true;
      while (shouldContinue) {
        List<AddressWithBalanceM>? resp;
        if (currentProvider == EProvider.Chainbase) {
          resp = await chainbaseProvider.getTopTokenHolders(
            chainId: mapENetworkToChainbaseProvider[chain.eNetwork],
            contractAddress: chain.address,
            page: page,
          );
        } else if (currentProvider == EProvider.Covalenthq) {
          // resp = await covalenthqProvider.getTopTokenHolders(
          //   chainName: mapENetworkToCovalentProvider[chain.eNetwork],
          //   tokenAddress: chain.address,
          //   pageNumber: page,
          //   date: DateFormat('yyyy-MM-dd').format(_selectedDate),
          // );
        }

        if (resp == null) {
          throw Exception('resp is null');
        }

        if (resp.isEmpty) {
          break;
        }
        temp.addAll(resp);
        page++;

        shouldContinue = resp[resp.length - 1].amount >= item.minBalance;
        if (currentProvider == EProvider.Chainbase) {
          await Future.delayed(const Duration(milliseconds: 1000));
        }
      }
    }

    print('temp ${temp.length}');
    await loadData(
      chainBases: temp,
      myToken: item,
      sheet: sheet,
      excelItemRows: excelItemRows,
    );
    // TelegramServices.instance.sendMessage(
    //   '> Export **${item.name}** **Success**',
    // );
  } catch (e) {
    print('onExportTopHolderByDay Error: $e');
  }
}

Future<void> onExportTopHolderAllTokens() async {
  if (currentProvider != EProvider.Chainbase) {
    currentProvider = EProvider.Chainbase;
  }

  for (int i = 0; i < myTokens.length; i++) {
    await onExportTopHolderByDay(myTokens[i]);
  }

  TelegramServices.instance.sendMessage(
    '> Export All Tokens **Success**',
  );
}
