import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthStat',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Page_Home(title: 'HealthStat'),
    );
  }
}

class Page_Home extends StatefulWidget
{
  const Page_Home({super.key, required this.title});

  final String title;

  @override
  State<Page_Home> createState() => _Page_HomeState();
}

class _Page_HomeState extends State<Page_Home>
{

  // Main app UI
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text(widget.title),
        actions:
        [

        ],
      ),
      body: SizedBox.expand
      (
        child: Text
        (
          "Test"
        ),
       ),
    );
  }
}
