import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:payme/addPayme.dart';
import 'package:payme/mainView.dart';
import 'package:payme/storage/storage.dart';

import 'models/payme_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PaymeModelAdapter());
  user = await Hive.openBox('payme');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainView(),
      routes: {
        '/AddPayme': (context) => AddPayme(),
      },
    );
  }
}
