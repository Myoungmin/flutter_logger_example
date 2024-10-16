import 'package:flutter/material.dart';
import 'package:flutter_logger_example/file_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final logger = FileLogger();

  runApp(MyApp(logger));
}

class MyApp extends StatelessWidget {
  final FileLogger logger;

  const MyApp(this.logger, {super.key});

  @override
  Widget build(BuildContext context) {
    logger.logInfo("앱 시작됨");

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Cross Platform Logger Example"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              logger.logDebug("버튼 클릭됨");
            },
            child: const Text("로그 기록하기"),
          ),
        ),
      ),
    );
  }
}
