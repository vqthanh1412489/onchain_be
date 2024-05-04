import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class TelegramServices {
  static const String chatId = '@max_onchain_noti';
  static const String botToken =
      '6817564737:AAEZlhmRkHL93iCETOpuZpL0M0uuKVYrxbg';

  TelegramServices._privateConstructor();
  static final TelegramServices _instance =
      TelegramServices._privateConstructor();
  static TelegramServices get instance => _instance;

  // Text of the message to be sent, 1-4096 characters after entities parsing
  // https://core.telegram.org/bots/api#sendmessage
  String _limitMessage(final String message) =>
      message.substring(0, min(4096, message.length));

  Future<void> sendMessage(String text) async {
    const String url = 'https://api.telegram.org/bot$botToken/sendMessage';
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> body = {
      'chat_id': chatId,
      'text': _limitMessage(text),
      'parse_mode': 'MarkdownV2',
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    print(json.encoder.convert(response.body));

    if (response.statusCode == 200) {
      print('Message sent successfully');
    } else {
      print('Failed to send message. Status code: ${response.statusCode}');
    }
  }
}
