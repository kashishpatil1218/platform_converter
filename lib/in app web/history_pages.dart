import 'package:flutter/material.dart';
import 'package:flutter_adv_ch4/in%20app%20web/db_helper.dart';
import 'package:flutter_adv_ch4/in%20app%20web/history.dart';
import 'package:flutter_adv_ch4/in%20app%20web/web_get_controller.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    super.key,
    required this.providerTrue,
    required this.providerFalse,
  });

  final WebGetProvider providerFalse;
  final WebGetProvider providerTrue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: const Text("History"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemCount: providerTrue.historyList.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              providerFalse.changeValue(value: index);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => History(
                    providerTrue: providerTrue,
                    providerFalse: providerFalse,
                  ),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri(
                      "${providerTrue.historyList[index].web}",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
