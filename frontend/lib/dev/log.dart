import 'package:logger/logger.dart';
import 'package:logger/web.dart';

class Log {
  static final Logger logger = Logger(
      printer: SimplePrinter(colors: true),
      filter: ProductionFilter(),
      output: ConsoleOutput());
}
