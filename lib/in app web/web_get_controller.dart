
import 'package:flutter/widgets.dart';
import 'package:flutter_adv_ch4/in%20app%20web/db_helper.dart';
import 'package:flutter_adv_ch4/in%20app%20web/web_model.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebGetProvider extends ChangeNotifier {
  InAppWebViewController? webViewController;
  TextEditingController txtSearch = TextEditingController();

  int indexValue = 0;
  int valueHistory = 0;
  List<WebModel> historyList = [];

  final List<dynamic> linkList = [
    "https://www.google.com/search?q=",
    "https://www.bing.com/search?q=",
    "https://yandex.com/search/?text=",
    "https://search.yahoo.com/search?d=%7b%22dn%22%3a%22yk%22%2c%22subdn%22%3a%22software%22%2c%22ykid%22%3a%22e25d36d5-42c6-4ea8-bd32-02f1d387fde1%22%7d&fr2=p%3ads%2cv%3aomn%2cm%3asa%2cbrws%3achrome%2cpos%3a1&fr=mcafee&type=E210US885G0&p=",
  ];

  void changeValue({required int value}) {
    valueHistory = value;
    notifyListeners();
  }

  void changeIndex({required int index}) {
    indexValue = index;
    notifyListeners();
  }

  Future<void> readDataFromDb() async {
    List<Map<String, dynamic>> data = await DbHelper.dbHelper.readData();
    historyList = data.map((e) => WebModel.fromMap(e)).toList();
    notifyListeners();
  }
}
