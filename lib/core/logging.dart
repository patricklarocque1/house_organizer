import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger buildLogger() {
  return Logger(
    level: kDebugMode ? Level.debug : Level.info,
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.none,
    ),
  );
}
