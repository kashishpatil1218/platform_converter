import 'package:flutter/material.dart';
import 'package:flutter_adv_ch4/in%20app%20web/db_helper.dart';
import 'package:flutter_adv_ch4/in%20app%20web/web_get_controller.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DbHelper.dbHelper.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WebGetProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // debugShowMaterialGrid: false,
        home: HomePage(),
      ),
    );
  }
}
