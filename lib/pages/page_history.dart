import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'page_overview.dart';
import '../components/card_graph.dart';


class Page_History extends StatefulWidget
{
  const Page_History({super.key});

  @override
  State<Page_History> createState() => _Page_HistoryState();
}

class _Page_HistoryState extends State<Page_History>
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
      appBar: AppBar
      (
        title: Text("History"),
        actions:
        [
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
              // Sample data
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
    );
  }
}
