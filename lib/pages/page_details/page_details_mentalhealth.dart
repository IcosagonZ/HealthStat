import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:fl_chart/fl_chart.dart';
import '../../components/card_graph.dart';

import '../page_overview.dart';
import '../page_add.dart';

class Page_Details_MentalHealth extends StatefulWidget
{
  const Page_Details_MentalHealth({
    Key? key,
  }) : super(key: key);

  @override
  State<Page_Details_MentalHealth> createState() => _Page_Details_MentalHealthState();
}

class _Page_Details_MentalHealthState extends State<Page_Details_MentalHealth>
{
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
        title: Text("Mental health"),
        actions:
        [
          IconButton
          (
            icon: Icon(Symbols.add),
            tooltip: "Add mood",
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return Page_AddData(data_type: "Mood");
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
                child: ListTile
                (
                  title: Text("Summary"),
                  subtitle: Text("Take a break"),
                  trailing: Icon(Symbols.cognition_2),
                ),
              ),
              SizedBox(height:16),
              Text("History", style: style_titlelarge),
              SizedBox(height:8),
              // Sample data
              CardGraph
              (
                text:"Mood",
                graph_data: graph_data_mood,
                graph_max_x: 7,
                graph_min_x: 1,
                graph_max_y: 10,
                graph_min_y: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
