import 'package:flutter/material.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'pages/page_overview.dart';

void main()
{
  // Database setup
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'HealthStat',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Page_Overview()
    );
  }
}
