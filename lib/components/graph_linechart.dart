import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
