import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../page_overview.dart';
import '../page_add.dart';

class Page_Details_Measurements extends StatefulWidget
{
  const Page_Details_Measurements({
    Key? key,
  }) : super(key: key);

  @override
  State<Page_Details_Measurements> createState() => _Page_Details_MeasurementsState();
}

class _Page_Details_MeasurementsState extends State<Page_Details_Measurements>
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

    return Scaffold
    (
      appBar: AppBar
      (
        title: Text("Body measurements"),
        actions:
        [
          IconButton
          (
            icon: Icon(Symbols.height),
            tooltip: "Add height",
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return Page_AddData(data_type: "Height");
                }
              ));
            }
          ),
          IconButton
          (
            icon: Icon(Symbols.weight),
            tooltip: "Add weight",
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return Page_AddData(data_type: "Weight");
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
              Text("Height and weight"),
            ],
          ),
        ),
      ),
    );
  }
}
