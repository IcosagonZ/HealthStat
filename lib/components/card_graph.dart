import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import "graph_linechart.dart";

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
