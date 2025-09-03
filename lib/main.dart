import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:fl_chart/fl_chart.dart';

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
    final text_theme = Theme.of(context).textTheme;

    Color color_primary = color_scheme.primary;
    Color color_secondary = color_scheme.secondary;
    Color color_onprimary = color_scheme.onPrimary;
    Color color_onsecondary = color_scheme.onSecondary;
    Color color_background = color_scheme.onBackground;
    Color color_surface = color_scheme.onSurface;

    final style_displaylarge = text_theme.displayLarge;
    final style_displaymedium = text_theme.displayMedium;
    final style_displaysmall = text_theme.displaySmall;

    final style_headlinelarge = text_theme.headlineLarge;
    final style_headlinemedium = text_theme.headlineMedium;
    final style_headlinesmall = text_theme.headlineSmall;

    final style_titlelarge = text_theme.titleLarge;
    final style_titlemedium = text_theme.titleMedium;
    final style_titlesmall = text_theme.titleSmall;

    // Development test data
    final List<FlSpot> graph_data_calories =
    [
      FlSpot(1, 1825),
      FlSpot(2, 1967),
      FlSpot(3, 2465),
      FlSpot(4, 1956),
      FlSpot(5, 1767),
      FlSpot(6, 1867),
      FlSpot(7, 1847),
    ];

    final List<FlSpot> graph_data_mood =
    [
      FlSpot(1, 8),
      FlSpot(2, 6),
      FlSpot(3, 5),
      FlSpot(4, 4),
      FlSpot(5, 5),
      FlSpot(6, 3),
      FlSpot(7, 7),
    ];

    final List<FlSpot> graph_data_weight =
    [
      FlSpot(1, 65),
      FlSpot(2, 67),
      FlSpot(3, 68),
      FlSpot(4, 68),
      FlSpot(5, 69),
      FlSpot(6, 67),
      FlSpot(7, 65),
    ];

    final List<FlSpot> graph_data_height =
    [
      FlSpot(1, 170),
      FlSpot(2, 170),
      FlSpot(3, 170),
      FlSpot(4, 170),
      FlSpot(5, 170),
      FlSpot(6, 170),
      FlSpot(7, 170),
    ];

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
        // Main tabs
        child: DefaultTabController
        (
          initialIndex: 1,
          length: 4,
          child: Column
          (
            children:
            [
              // Top bar
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

              // Main avatar display
              Expanded
              (
                child: TabBarView
                (
                  children:
                  [
                    // Overview tab
                    Center(child: Column
                      (
                        children:
                        [
                          Expanded
                          (
                            //padding: EdgeInsets.all(16),
                            child: Padding
                            (
                              padding: EdgeInsets.all(16),
                              child: Row
                              (
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:
                                [
                                  // Buttons in left side of overview tab
                                  Column
                                  (
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                    [
                                      ElevatedButton
                                      (
                                        child: Padding
                                        (
                                          child: Icon(Symbols.restaurant, size: 32),
                                          padding: EdgeInsets.all(8),
                                        ),
                                        onPressed: ()
                                        {

                                        }
                                      ),
                                      SizedBox(height: 16),
                                      ElevatedButton
                                      (
                                        //child: Icon(Symbols.directions_run),
                                        child: Padding
                                        (
                                          child: Icon(Symbols.directions_run, size: 32),
                                          padding: EdgeInsets.all(8),
                                        ),
                                        onPressed: ()
                                        {

                                        }
                                      ),
                                      SizedBox(height: 16),
                                      ElevatedButton
                                      (
                                        //child: Icon(Symbols.weight),
                                        child: Padding
                                        (
                                          child: Icon(Symbols.weight, size: 32),
                                          padding: EdgeInsets.all(8),
                                        ),
                                        onPressed: ()
                                        {

                                        }
                                      ),
                                    ],
                                  ),

                                  Expanded
                                  (
                                    child: SvgPicture.asset
                                    (
                                      "assets/avatar.svg",
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  // Buttons in right side of overview tab
                                  Column
                                  (
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                    [
                                      ElevatedButton
                                      (
                                        //child: Icon(Symbols.mood),
                                        child: Padding
                                        (
                                          child: Icon(Symbols.mood, size: 32),
                                          padding: EdgeInsets.all(8),
                                        ),
                                        onPressed: ()
                                        {

                                        }
                                      ),
                                      SizedBox(height: 16),
                                      ElevatedButton
                                      (
                                        //child: Icon(Symbols.microbiology),
                                        child: Padding
                                        (
                                          child: Icon(Symbols.microbiology, size: 32),
                                          padding: EdgeInsets.all(8),
                                        ),
                                        onPressed: ()
                                        {

                                        }
                                      ),
                                      SizedBox(height: 16),
                                      ElevatedButton
                                      (
                                        //child: Icon(Symbols.height),
                                        child: Padding
                                        (
                                          child: Icon(Symbols.height, size: 32),
                                          padding: EdgeInsets.all(8),
                                        ),
                                        onPressed: ()
                                        {

                                        }
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                             ),
                          ),

                          // Overview bottom section
                          Container
                          (
                            margin: EdgeInsets.all(16),

                            child: Column
                            (
                              children: [
                                Text("Calories", style: style_titlelarge),
                                SizedBox(height: 4),

                                // Progress bar: Stackover flow answer
                                Stack(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                      child: LinearProgressIndicator(
                                        value: 0.6,
                                        backgroundColor: color_background,
                                        valueColor: AlwaysStoppedAnimation<Color>(color_primary),
                                      ),
                                    ),
                                    Align(child: Text("600/1000", style: TextStyle(color: color_onprimary)), alignment: Alignment.topCenter,),
                                  ],
                                ),

                                SizedBox(height: 16),

                                Text("Overview", style: style_titlelarge),
                                SizedBox(height: 4),
                                Text("Looking good", style: style_displaysmall),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Journal tab
                    Center(child: Padding
                      (
                        padding: EdgeInsets.all(16),
                        child: ListView
                        (
                          children:
                          [
                            // Sample data
                            CardJournal(heading: "Walk", activity: "Sport", time: "7:03 am", date: "1/9/25"),
                            CardJournal(heading: "Outing with friends", activity: "Food", time: "2:05 pm", date: "2/9/25"),
                            CardJournal(heading: "Badminton", activity: "Sport", time: "5:21 pm", date: "2/9/25"),
                            CardJournal(heading: "Walk", activity: "Sport", time: "7:12 am", date: "3/9/25"),
                            CardJournal(heading: "Feeling depressed", activity: "Mood", time: "12:15 am", date: "4/9/25"),
                          ],
                        ),
                       ),
                    ),

                    // History tab
                    Center(child: Padding
                      (
                        padding: EdgeInsets.all(16),
                        child: ListView
                        (
                          children:
                          [
                            CardGraph
                            (
                              text:"Calories",
                              graph_data: graph_data_calories,
                              graph_max_x: 7,
                              graph_min_x: 1,
                              graph_max_y: 3000,
                              graph_min_y: 1000,
                            ),

                            CardGraph
                            (
                              text:"Mood",
                              graph_data: graph_data_mood,
                              graph_max_x: 7,
                              graph_min_x: 1,
                              graph_max_y: 10,
                              graph_min_y: 0,
                            ),

                            CardGraph
                            (
                              text:"Weight",
                              graph_data: graph_data_weight,
                              graph_max_x: 7,
                              graph_min_x: 1,
                              graph_max_y: 70,
                              graph_min_y: 60,
                            ),

                            CardGraph
                            (
                              text:"Height",
                              graph_data: graph_data_height,
                              graph_max_x: 7,
                              graph_min_x: 1,
                              graph_max_y: 180,
                              graph_min_y: 160,
                            ),
                          ],
                        ),
                       ),
                    ),

                    // Add data tab
                    Center(child: Padding
                      (
                        padding: EdgeInsets.all(16),
                        child: Column
                        (
                          children:
                          [
                            Text("4"),
                          ],
                        ),
                       ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardJournal extends StatelessWidget
{
  final String heading;
  final String activity;
  final String time;
  final String date;

  const CardJournal({
    Key? key,
    required this.heading,
    required this.activity,
    required this.time,
    required this.date
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    // Default theme variables
    final color_scheme = Theme.of(context).colorScheme;
    final text_theme = Theme.of(context).textTheme;

    Color color_primary = color_scheme.primary;
    //Color color_secondary = color_scheme.secondary;
    Color color_onprimary = color_scheme.onPrimary;
    //Color color_onsecondary = color_scheme.onSecondary;
    Color color_background = color_scheme.onBackground;
    Color color_surface = color_scheme.onSurface;

    //final style_displaylarge = text_theme.displayLarge;
    //final style_displaymedium = text_theme.displayMedium;
    //final style_displaysmall = text_theme.displaySmall;

    //final style_headlinelarge = text_theme.headlineLarge;
    //final style_headlinemedium = text_theme.headlineMedium;
    final style_headlinesmall = text_theme.headlineSmall;

    final style_titlelarge = text_theme.titleLarge;
    //final style_titlemedium = text_theme.titleMedium;
    //final style_titlesmall = text_theme.titleSmall;

    return Center
    (
      child: Card
      (
        clipBehavior: Clip.hardEdge,
        child: InkWell
        (
          splashColor: color_onprimary,
          onTap: ()
          {
            //debugPrint("Note tapped");
          },
          child: Row
          (
            children:
            [
              Expanded
              (
                //width: 300,
                //height: 100,
                child: Padding
                (
                  padding: EdgeInsets.all(16),
                  child: Row
                  (
                    children:
                    [
                      Text("$heading"),
                      Expanded(
                        child: Text(" ")
                      ),
                      Text("$activity", style: TextStyle(color: color_primary)),
                      SizedBox(width: 16),
                      Text("$time"),
                      Text(" - "),
                      Text("$date")
                    ]
                  )
                )
              ),
            ],
           ),
        ),
      ),
    );
  }
}

class CardGraph extends StatelessWidget
{
  final String text;

  final List<FlSpot> graph_data;

  final double graph_min_x;
  final double graph_max_x;
  final double graph_min_y;
  final double graph_max_y;

  //final int graph_height;

  const CardGraph({
    Key? key,
    required this.text,
    required this.graph_data,

    required this.graph_min_x,
    required this.graph_max_x,
    required this.graph_min_y,
    required this.graph_max_y,
  }) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    // Default theme variables
    final color_scheme = Theme.of(context).colorScheme;
    final text_theme = Theme.of(context).textTheme;

    Color color_primary = color_scheme.primary;
    //Color color_secondary = color_scheme.secondary;
    Color color_onprimary = color_scheme.onPrimary;
    //Color color_onsecondary = color_scheme.onSecondary;
    Color color_background = color_scheme.onBackground;
    Color color_surface = color_scheme.onSurface;

    //final style_displaylarge = text_theme.displayLarge;
    //final style_displaymedium = text_theme.displayMedium;
    //final style_displaysmall = text_theme.displaySmall;

    //final style_headlinelarge = text_theme.headlineLarge;
    //final style_headlinemedium = text_theme.headlineMedium;
    final style_headlinesmall = text_theme.headlineSmall;

    final style_titlelarge = text_theme.titleLarge;
    //final style_titlemedium = text_theme.titleMedium;
    //final style_titlesmall = text_theme.titleSmall;

    return Center
    (
      child: Card
      (
        clipBehavior: Clip.hardEdge,
        child: InkWell
        (
          splashColor: color_onprimary,
          onTap: ()
          {
            //debugPrint("Note tapped");
          },
          child: Row
          (
            children:
            [
              Expanded
              (
                //width: 300,
                //height: 100,
                child: Padding
                (
                  padding: EdgeInsets.all(16),
                  child: Column
                  (
                    children:
                    [
                      Text("$text", style: TextStyle(color: color_primary)),
                      SizedBox(height: 16),
                      GraphChart
                      (
                        graph_data: graph_data,
                        graph_max_x: graph_max_x,
                        graph_min_x: graph_min_x,
                        graph_max_y: graph_max_y,
                        graph_min_y: graph_min_y,
                        graph_height: 200,
                      ),
                    ]
                  )
                )
              ),
            ],
           ),
        ),
      ),
    );
  }
}

class GraphChart extends StatelessWidget
{
  /*
  final List<FlSpot> graph_data =
  [
    FlSpot(1, 65),
    FlSpot(2, 67),
    FlSpot(3, 68),
    FlSpot(4, 63),
    FlSpot(5, 69),
  ];
  */

  final List<FlSpot> graph_data;

  final double graph_min_x;
  final double graph_max_x;
  final double graph_min_y;
  final double graph_max_y;

  final double graph_height;

  const GraphChart({
    Key? key,
    required this.graph_data,

    required this.graph_min_x,
    required this.graph_max_x,
    required this.graph_min_y,
    required this.graph_max_y,

    required this.graph_height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    // Default theme variables
    final color_scheme = Theme.of(context).colorScheme;
    //final text_theme = Theme.of(context).textTheme;

    Color color_primary = color_scheme.primary;
    //Color color_secondary = color_scheme.secondary;
    //Color color_onprimary = color_scheme.onPrimary;
    //Color color_onsecondary = color_scheme.onSecondary;
    //Color color_background = color_scheme.onBackground;
    //Color color_surface = color_scheme.onSurface;

    //final style_displaylarge = text_theme.displayLarge;
    //final style_displaymedium = text_theme.displayMedium;
    //final style_displaysmall = text_theme.displaySmall;

    //final style_headlinelarge = text_theme.headlineLarge;
    //final style_headlinemedium = text_theme.headlineMedium;
    //final style_headlinesmall = text_theme.headlineSmall;

    //final style_titlelarge = text_theme.titleLarge;
    //final style_titlemedium = text_theme.titleMedium;
    //final style_titlesmall = text_theme.titleSmall;

    return SizedBox
    (
      //aspectRatio: 1,
      height: graph_height,
      child: LineChart
      (
        LineChartData
        (
          minX: graph_min_x,
          maxX: graph_max_x,
          minY: graph_min_y,
          maxY: graph_max_y,

          gridData: FlGridData(show: true),
          borderData: FlBorderData
          (
            show: false,
            border: Border.all(color: color_primary, width: 1),
          ),

          titlesData: FlTitlesData(
            topTitles: AxisTitles
            (
              sideTitles: SideTitles
              (
                showTitles: false
              ),
            ),
            bottomTitles: AxisTitles
            (
              sideTitles: SideTitles
              (
                showTitles: true,
                reservedSize: 30,
                interval: 1,
              ),
            ),

            leftTitles: AxisTitles
            (
              sideTitles: SideTitles
              (
                showTitles: true,
                reservedSize: 50,
                //interval: 1,
              ),
            ),

            rightTitles: AxisTitles
            (
              sideTitles: SideTitles
              (
                showTitles: true,
                reservedSize: 50,
                getTitlesWidget: (value, meta)
                {
                  return Text("");
                },
              ),
            ),
          ),

        lineBarsData:
        [
          LineChartBarData
          (
            spots: graph_data,
            isCurved: true,
            barWidth: 3,
            color: color_primary,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData
            (
              show: false,
              color: color_primary,
            ),
          ),
        ],
        ),
      ),
    );
  }
}
