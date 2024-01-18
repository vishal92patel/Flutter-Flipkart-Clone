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

class AdvancedCharts extends StatelessWidget {
  const AdvancedCharts({super.key});

  void fromFlutterToWebView() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Advanced Charts"),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
            "http://127.0.0.1:9901/index.html",
          ),
        ),
        onWebViewCreated: (controller) {
          controller.addJavaScriptHandler(
            handlerName: "initiate",
            callback: (args) {
              return {
                "dispSym": "TCS_NSE",
                "exchange": "NSE",
              };
            },
          );
        },
        onLoadStart: (controller, url) {},
        onLoadStop: (controller, url) {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fromFlutterToWebView,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
