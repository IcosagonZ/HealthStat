import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'page_overview.dart';

import '../data/database.dart';

class Page_Settings extends StatefulWidget
{
  const Page_Settings({
    Key? key,
  }) : super(key: key);

  @override
  State<Page_Settings> createState() => _Page_SettingsState();
}

class _Page_SettingsState extends State<Page_Settings>
{
  String settings_database_path = "N/A";

  @override
  void initState()
  {
    settings_update_display();
    super.initState();
  }

  Future<void> settings_update_display() async
  {
    String _settings_database_path = await database_path();
    setState(()
    {
      settings_database_path = _settings_database_path;
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
        title: Text("Settings"),
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
              Text("Database path", style: style_titlelarge),
              SizedBox(height: 8),
              Text(settings_database_path),
              SizedBox(height: 8),
              ElevatedButton
              (
                child: Text("Delete database"),
                onPressed: (){
                  database_delete();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
