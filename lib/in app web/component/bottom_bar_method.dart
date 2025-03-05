import 'package:flutter/material.dart';
import 'package:flutter_adv_ch4/in%20app%20web/component/popup_menu_button_method.dart';

import '../web_get_controller.dart';

Container bottomBarMethod(
    WebGetProvider providerTrue, WebGetProvider providerFalse) {
  return Container(
    height: 60,
    width: double.infinity,
    color: Colors.grey.shade200,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          onPressed: () {
            providerTrue.webViewController!.goBack();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        IconButton(
          onPressed: () {
            providerTrue.webViewController!.goForward();
          },
          icon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
        IconButton(
          onPressed: () {
            providerTrue.webViewController!.reload();
          },
          icon: const Icon(Icons.rotate_left),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home_outlined),
        ),
        popupMenuButtonMethod(providerFalse, providerTrue)
      ],
    ),
  );
}
