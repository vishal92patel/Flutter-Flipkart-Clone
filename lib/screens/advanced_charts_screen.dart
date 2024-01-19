import 'dart:math';

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
  late InAppWebViewController? inAppWebViewController;
  bool isServerStarted = false;

  void fromFlutterToWebView() {
    final data = {
      "open": random.nextInt(1000) + 3000,
      "close": random.nextInt(1000) + 3000,
      "high": random.nextInt(1000) + 3000,
      "low": random.nextInt(1000) + 3000,
      "time": DateTime.now().millisecondsSinceEpoch,
      "volume": random.nextInt(99) + 100,
    };
    inAppWebViewController!.evaluateJavascript(source: """
      window.postMessage($data);
    """);
  }

  @override
  void initState() {
    _setupLocalServer();
    super.initState();
  }

  @override
  void dispose() {
    localhostServer.close();
    super.dispose();
  }

  _setupLocalServer() async {
    WidgetsFlutterBinding.ensureInitialized();
    await localhostServer.start();
    setState(() {
      isServerStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Advanced Charts"),
      ),
      body: isServerStarted
          ? InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(
                  "http://127.0.0.1:9901/index.html",
                ),
              ),
              onWebViewCreated: (controller) {
                setState(() {
                  inAppWebViewController = controller;
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
                  inAppWebViewController = controller;
                });
                print("${consoleMessage} vishal");
              },
            )
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: fromFlutterToWebView,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
