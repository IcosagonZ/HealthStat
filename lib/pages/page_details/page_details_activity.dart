import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:intl/intl.dart';
//import 'package:fl_chart/fl_chart.dart';
//import '../../components/card_graph.dart';

import '../page_overview.dart';
import '../page_add.dart';

import '../../components/card_timeline.dart';

import "../../data/database.dart";

class Page_Details_Activity extends StatefulWidget
{
  const Page_Details_Activity({
    Key? key,
  }) : super(key: key);

  @override
  State<Page_Details_Activity> createState() => _Page_Details_ActivityState();
}

class _Page_Details_ActivityState extends State<Page_Details_Activity>
{
  /*
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
  */

  // Activity data
  List<ActivityData> data_activities_copy = [];
  int activity_today = 0;
  int activity_yesterday = 0;

  // Init
  @override
  void initState()
  {
    page_activities_update();
    super.initState();
  }

  Future<void> page_activities_update() async
  {
    List<ActivityData> data_activities_result = await database_activities_retrive();
    final int activity_today_result = await data_activities_date(DateTime.now());
    final int activity_yesterday_result = await data_activities_date(DateTime.now().subtract(Duration(days: 1)));

    setState(()
    {
      data_activities_copy = data_activities_result;
      activity_today = activity_today_result;
      activity_yesterday = activity_yesterday_result;
    }
    );
  }

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

    return Scaffold
    (
      appBar: AppBar
      (
        title: Text("Activity"),
        actions:
        [
          IconButton
          (
            icon: Icon(Symbols.add),
            tooltip: "Add data",
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return Page_AddData(data_type: "Sports");
                }
              ));
            }
          ),
          SizedBox(width: 8)
        ],
      ),
      body: SizedBox.expand
      (
        child: Padding
        (
          padding: EdgeInsets.all(16),
          child: ListView
          (
            children:
            [
              Text("Overview", style: style_titlelarge),
              SizedBox(height:8),
              Card
              (
                clipBehavior: Clip.hardEdge,
                child: Padding
                (
                  padding: EdgeInsets.all(16),
                  child: Row
                  (
                    children:
                    [
                      Expanded
                      (
                        child: Column
                        (
                          children:
                          [
                            Row
                            (
                              children:
                              [
                                Expanded
                                (
                                  child: Text("Calories today ")
                                ),
                                Text('${activity_today} cal')
                              ]
                            ),
                            Row
                            (
                              children:
                              [
                                Expanded
                                (
                                  child: Text("Calories yesterday ")
                                ),
                                Text('${activity_yesterday} cal')
                              ]
                            ),
                            /*
                            Row
                            (
                              children:
                              [
                                Expanded
                                (
                                  child: Text("Distance ")
                                ),
                                Text("2.7 km")
                              ]
                            ),
                            Row
                            (
                              children:
                              [
                                Expanded
                                (
                                  child: Text("Steps ")
                                ),
                                Text("2314 steps")
                              ]
                            ),
                            */
                          ]
                        ),
                      ),
                      /*
                      SizedBox(width: 16),
                      CircleAvatar
                      (
                        radius: 32,
                        child: Text("10"),
                      )
                      */
                    ],
                  )
                )
              ),
              SizedBox(height:16),
              Text("Recent", style: style_titlelarge),
              SizedBox(height:8),
              Padding
              (
                padding: EdgeInsets.all(1),
                child: Stack
                (
                  children:
                  [
                    SizedBox(
                      height: 120,
                      child: Visibility
                      (
                        visible: (data_activities_copy.isNotEmpty),
                        child: ListView
                        (
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: data_activities_copy.map((data)
                          {
                            DateTime data_creation_time = data.creation_time;
                            return CardTimeline
                            (
                              heading: '${data.calories} cal',
                              subtitle: data.activity,
                              time: DateFormat("hh:mm a").format(data_creation_time),
                              date: DateFormat("dd/M/yy").format(data_creation_time)
                            );
                          }
                          ).toList(),
                        ),
                      ),
                    ),
                    Visibility
                    (
                      visible: (data_activities_copy.isEmpty),
                      child: Center
                      (
                        child: Text("No data"),
                      )
                    )
                  ]
                )
              ),
              /*
              SizedBox(height:16),
              Text("History", style: style_titlelarge),
              SizedBox(height:8),
              // Sample data
              CardGraph
              (
                text:"Calories Expenditure",
                graph_data: graph_data_calories,
                graph_max_x: 7,
                graph_min_x: 1,
                graph_max_y: 3000,
                graph_min_y: 1000,
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}
