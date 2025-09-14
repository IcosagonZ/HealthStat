import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../page_overview.dart';
import '../page_add.dart';

class Page_Details_Disease extends StatefulWidget
{
  const Page_Details_Disease({
    Key? key,
  }) : super(key: key);

  @override
  State<Page_Details_Disease> createState() => _Page_Details_DiseaseState();
}

class _Page_Details_DiseaseState extends State<Page_Details_Disease>
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
        title: Text("Disease"),
        actions:
        [
          IconButton
          (
            icon: Icon(Symbols.add),
            tooltip: "Add disease",
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return Page_AddData(data_type: "Disease");
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
                  subtitle: Text("You are healthy"),
                  trailing: Icon(Symbols.conditions),
                ),
              ),
              SizedBox(height:16),
              Text("Tracking", style: style_titlelarge),
              SizedBox(height:8),
              // Sample data
              Card
              (
                child: Column
                (
                  children:
                  [
                    ListTile
                    (
                      title: Text("Cough"),
                      trailing: Icon(Symbols.ent),
                    ),
                    ListTile
                    (
                      title: Text("Fever"),
                      trailing: Icon(Symbols.sick),
                    ),
                    ListTile
                    (
                      title: Text("Cold"),
                      trailing: Icon(Symbols.sick),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
