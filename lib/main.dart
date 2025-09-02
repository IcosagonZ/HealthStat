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
    final color_scheme = Theme.of(context).colorScheme;

    Color color_primary = color_scheme.primary;
    Color color_secondary = color_scheme.secondary;
    Color color_onprimary = color_scheme.onPrimary;
    Color color_onsecondary = color_scheme.onSecondary;
    Color color_background = color_scheme.onBackground;
    Color color_surface = color_scheme.onSurface;

    return Scaffold
    (
      /*appBar: AppBar
      (
        title: Text(widget.title),
        actions:
        [

        ],
      ),*/
      body: SizedBox.expand
      (
        child: DefaultTabController
        (
          initialIndex: 1,
          length: 4,
          child: Column
          (
            children:
            [
              Container
              (
                margin: EdgeInsets.only(top: 16),

                child: TabBar
                (
                  tabs:
                  [
                    Tab(icon: Icon(Icons.dashboard), text: "Overview"),
                    Tab(icon: Icon(Icons.event_note), text: "Journal"),
                    Tab(icon: Icon(Icons.history), text: "History"),
                    Tab(icon: Icon(Icons.assignment_add), text: "Add"),
                  ],
                  labelColor: color_primary,
                  unselectedLabelColor: color_secondary,
                ),
              ),
              Expanded
              (
                child: TabBarView
                (
                  children:
                  [
                    Center(child:
                      Text('1')
                    ),
                    Center(child:
                      Text('2')
                    ),
                    Center(child:
                      Text('3')
                    ),
                    Center(child:
                      Text('4')
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
       ),
    );
  }
}
