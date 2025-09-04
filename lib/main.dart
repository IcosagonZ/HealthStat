import 'package:flutter/material.dart';

import 'pages/page_overview.dart';
import 'pages/page_journal.dart';
import 'pages/page_history.dart';
import 'pages/page_adddata.dart';

void main()
{
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
      home: Page_Overview(),
    );
  }
}
