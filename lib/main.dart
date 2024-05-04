import 'dart:async' show Future, Timer;

import 'package:cli/cli.dart' as cli;
import 'package:cli/constants/my_tokens.dart';
import 'package:cron/cron.dart';

import 'services/telegram_services.dart';

void main() async {
  Timer.periodic(const Duration(minutes: 1), (timer) {
    print('periodic.... ${DateTime.now()}');
    TelegramServices.instance.sendMessage(
      '> periodic.:  **Success**',
    );
  });

  final cron = Cron();
  cron.schedule(Schedule.parse('0 * 9-10 * * *'), () async {
    print('Running cron job at ${DateTime.now()}');
  });
  cron.schedule(Schedule.parse('0 * 2-3 * * *'), () async {
    print('Running cron job at ...: ${DateTime.now()}');
    TelegramServices.instance.sendMessage(
      '> Export Running cron job at ...:  **Success**',
    );
  });
}
