import 'package:logger/logger.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileLogger {
  late Logger _logger;
  late File _logFile;

  FileLogger() {
    _initLogger();
  }

  Future<void> _initLogger() async {
    final directory = await getApplicationDocumentsDirectory();
    final date = DateTime.now().toIso8601String().split('T').first;
    final path = '${directory.path}/app_$date.log';
    _logFile = File(path);

    _logger = Logger(
      printer: PrettyPrinter(),
      output: _FileLogOutput(_logFile),
    );
  }

  void logDebug(String message) => _logger.d(message);
  void logInfo(String message) => _logger.i(message);
  void logError(String message) => _logger.e(message);
}

class _FileLogOutput extends LogOutput {
  final File logFile;
  _FileLogOutput(this.logFile);

  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      logFile.writeAsStringSync('${DateTime.now().toIso8601String()} $line\n',
          mode: FileMode.append);
    }
  }
}
