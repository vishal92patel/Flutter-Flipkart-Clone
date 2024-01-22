import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

enum Actions { onDOMContentLoaded }

class JavaScriptMessageModal {
  late String action;
  late String data;
  JavaScriptMessageModal({
    required this.action,
    required this.data,
  });

  JavaScriptMessageModal.fromJson(Map json) {
    action = json['action'].toString();
    data = json['data'].toString();
  }
}

final InAppLocalhostServer localhostServer = InAppLocalhostServer(
  documentRoot: 'assets/charting_library',
  port: 9901,
  shared: false,
);

final Random random = Random();

class AdvancedCharts extends StatefulWidget {
  const AdvancedCharts({super.key});

  @override
  State<AdvancedCharts> createState() => _AdvancedChartsState();
}

class _AdvancedChartsState extends State<AdvancedCharts> {
  late InAppWebViewController? _inAppWebViewController;
  bool _isServerStarted = false;
  late final Timer _timer;

  void fromFlutterToWebView(Timer t) {
    final data = {
      "open": random.nextInt(10) + 3450,
      "close": random.nextInt(10) + 3450,
      "high": random.nextInt(10) + 3450,
      "low": random.nextInt(10) + 3440,
      "time": DateTime.now().millisecondsSinceEpoch,
      "volume": random.nextInt(99) + 100,
    };
    _inAppWebViewController!.evaluateJavascript(source: """
      window.postMessage($data);
    """);
  }

  @override
  void initState() {
    super.initState();
    _setupLocalServer();
    _timer = Timer.periodic(
        const Duration(
          milliseconds: 500,
        ),
        fromFlutterToWebView);
  }

  @override
  void dispose() {
    localhostServer.close();
    _timer.cancel();
    super.dispose();
  }

  _setupLocalServer() async {
    WidgetsFlutterBinding.ensureInitialized();
    await localhostServer.start();
    setState(() {
      _isServerStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Advanced Charts"),
      ),
      body: _isServerStarted
          ? InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(
                  "http://127.0.0.1:9901/index.html",
                ),
              ),
              onWebViewCreated: (controller) {
                setState(() {
                  _inAppWebViewController = controller;
                });
                controller.addJavaScriptHandler(
                  handlerName: "initiate",
                  callback: (args) {
                    return {
                      "scripId": "532540",
                      "dispSym": "TCS",
                      "exchange": "BSE",
                    };
                  },
                );
              },
              // onLoadStop: (controller, url) {
              //   controller.evaluateJavascript(source: """
              //     const event = {
              //     detail: {foo: 1, bar: false}
              //     };
              //     window.postMessage(event);
              //       """);
              // },
              onConsoleMessage: (controller, consoleMessage) {
                setState(() {
                  _inAppWebViewController = controller;
                });
                if (kDebugMode) {
                  print("$consoleMessage");
                }
              },
            )
          : null,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fromFlutterToWebView,
      //   child: const Icon(Icons.arrow_upward),
      // ),
    );
  }
}
