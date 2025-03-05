import 'package:flutter/material.dart';
import 'package:flutter_adv_ch4/in%20app%20web/db_helper.dart';
import 'package:flutter_adv_ch4/in%20app%20web/web_get_controller.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class History extends StatelessWidget {
  const History(
      {super.key, required this.providerTrue, required this.providerFalse});

  final WebGetProvider providerFalse;
  final WebGetProvider providerTrue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(
              "${providerTrue.historyList[providerTrue.valueHistory].web}",
            ),
          ),
        ),
      ),
    );
  }
}
