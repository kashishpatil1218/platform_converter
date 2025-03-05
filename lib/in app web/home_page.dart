import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adv_ch4/in%20app%20web/db_helper.dart';
import 'package:flutter_adv_ch4/in%20app%20web/web_get_controller.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import 'component/bottom_bar_method.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<WebGetProvider>(context, listen: true);
    var providerFalse = Provider.of<WebGetProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: providerTrue.txtSearch,
                    decoration: const InputDecoration(
                      hintText: "🔍 Search or enter URL",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              providerTrue.webViewController!.loadUrl(
                urlRequest: URLRequest(
                  url: WebUri(
                    "${providerTrue.linkList[providerTrue.indexValue]}${providerTrue.txtSearch.text}",
                  ),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
            "${providerTrue.linkList[providerTrue.indexValue]}${providerTrue.txtSearch.text}",

          ),
        ),
        onWebViewCreated: (controller) {
          providerTrue.webViewController = controller;
        },
        onLoadStart: (controller, url) async {
          providerFalse.changeValue(value: url!.port);
          // todo: log(url.query);
          String? title = await controller.getTitle();
          await DbHelper.dbHelper.addData(title!, url.toString());
        },
      ),
      bottomNavigationBar: bottomBarMethod(providerTrue, providerFalse),
    );
  }
}
