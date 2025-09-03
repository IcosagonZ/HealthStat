import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/symbols.dart';

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
                    Center(child:
                      Column
                      (
                        children:
                        [
                          Text("2"),
                        ],
                      )
                    ),

                    // History tab
                    Center(child:
                      Column
                      (
                        children:
                        [
                          Text("3"),
                        ],
                      )
                    ),

                    // Add data tab
                    Center(child:
                     Column
                      (
                        children:
                        [
                          Text("4"),
                        ],
                      )
                    ),
                  ],
                ),
              ),

              // Bottom section overview
              /*
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
              */
            ],
          ),
        ),
      ),
    );
  }
}
