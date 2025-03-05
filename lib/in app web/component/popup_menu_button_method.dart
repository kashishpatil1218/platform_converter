import 'package:flutter/material.dart';
import 'package:flutter_adv_ch4/in%20app%20web/history_pages.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../db_helper.dart';
import '../web_get_controller.dart';

PopupMenuButton<dynamic> popupMenuButtonMethod(
    WebGetProvider providerFalse, WebGetProvider providerTrue) {
  return PopupMenuButton(
    icon: const Icon(Icons.menu),
    itemBuilder: (context) => [
      PopupMenuItem(
        onTap: () {
          providerFalse.changeIndex(index: 0);
          providerTrue.webViewController!.loadUrl(
            urlRequest: URLRequest(
              url: WebUri(
                "${providerTrue.linkList[providerTrue.indexValue]}",
              ),
            ),
          );
        },
        child: const Text("Google"),
      ),
      PopupMenuItem(
        onTap: () {
          providerFalse.changeIndex(index: 1);
          providerTrue.webViewController!.loadUrl(
            urlRequest: URLRequest(
              url: WebUri(
                "${providerTrue.linkList[providerTrue.indexValue]}",
              ),
            ),
          );
        },
        child: const Text("Bing"),
      ),
      PopupMenuItem(
        onTap: () {
          providerFalse.changeIndex(index: 2);
          providerTrue.webViewController!.loadUrl(
            urlRequest: URLRequest(
              url: WebUri(
                "${providerTrue.linkList[providerTrue.indexValue]}",
              ),
            ),
          );
        },
        child: const Text("Yandex"),
      ),
      PopupMenuItem(
        onTap: () {
          providerFalse.changeIndex(index: 3);
          providerTrue.webViewController!.loadUrl(
            urlRequest: URLRequest(
              url: WebUri(
                "${providerTrue.linkList[providerTrue.indexValue]}",
              ),
            ),
          );
        },
        child: const Text("yahoo"),
      ),
      PopupMenuItem(
        onTap: () async {
          await providerFalse.readDataFromDb();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HistoryPage(
                providerTrue: providerTrue,
                providerFalse: providerFalse,
              ),
            ),
          );
        },
        child: const Text("History"),
      ),
      PopupMenuItem(
        onTap: () {
          for (int i = 0; i <= providerTrue.historyList.length; i++) {
            DbHelper.dbHelper.delete(providerTrue.historyList[i].id!);
          }
        },
        child: const Text("Clear History"),
      ),
      const PopupMenuItem(
        child: Text("Book marks"),
      ),
    ],
  );
}
