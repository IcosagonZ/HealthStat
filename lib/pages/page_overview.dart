import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'page_journal.dart';
import 'page_history.dart';
import 'page_adddata.dart';
import 'page_settings.dart';

class Page_Overview extends StatefulWidget
{
  const Page_Overview({super.key});

  @override
  State<Page_Overview> createState() => _Page_OverviewState();
}

class _Page_OverviewState extends State<Page_Overview>
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
        title: Text("Overview"),
        actions:
        [
          IconButton
          (
            icon: Icon(Symbols.event_note),
            tooltip: "Journal",
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return const Page_Journal();
                }
              ));
            }
          ),
          IconButton
          (
            icon: Icon(Symbols.history),
            tooltip: "History",
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return const Page_History();
                }
              ));
            }
          ),
          IconButton
          (
            icon: Icon(Symbols.settings),
            tooltip: "Settings",
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return const Page_Settings();
                }
              ));
            }
          ),
        ],
      ),
      body: SizedBox.expand
      (
        // Main tabs
        child: Column
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)
                              {
                                return const Page_AddData(data_type: "Calorie");
                              }
                            ));
                          }
                        ),
                        SizedBox(height: 16),
                        ElevatedButton
                        (
                          child: Padding
                          (
                            child: Icon(Symbols.directions_run, size: 32),
                            padding: EdgeInsets.all(8),
                          ),
                          onPressed: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)
                              {
                                return const Page_AddData(data_type: "Sports");
                              }
                            ));
                          }
                        ),
                        SizedBox(height: 16),
                        ElevatedButton
                        (
                          child: Padding
                          (
                            child: Icon(Symbols.weight, size: 32),
                            padding: EdgeInsets.all(8),
                          ),
                          onPressed: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)
                              {
                                return const Page_AddData(data_type: "Weight");
                              }
                            ));
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
                          child: Padding
                          (
                            child: Icon(Symbols.mood, size: 32),
                            padding: EdgeInsets.all(8),
                          ),
                          onPressed: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)
                              {
                                return const Page_AddData(data_type: "Mood");
                              }
                            ));
                          }
                        ),
                        SizedBox(height: 16),
                        ElevatedButton
                        (
                          child: Padding
                          (
                            child: Icon(Symbols.microbiology, size: 32),
                            padding: EdgeInsets.all(8),
                          ),
                          onPressed: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)
                              {
                                return const Page_AddData(data_type: "Disease");
                              }
                            ));
                          }
                        ),
                        SizedBox(height: 16),
                        ElevatedButton
                        (
                          child: Padding
                          (
                            child: Icon(Symbols.height, size: 32),
                            padding: EdgeInsets.all(8),
                          ),
                          onPressed: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)
                              {
                                return const Page_AddData(data_type: "Height");
                              }
                            ));
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
    );
  }
}
