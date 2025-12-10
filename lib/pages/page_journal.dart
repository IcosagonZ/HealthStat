import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:intl/intl.dart';

import 'page_overview.dart';
import 'page_journal_full.dart';

import '../components/card_timeline.dart';
import '../data/database.dart';

class Page_Journal extends StatefulWidget
{
  const Page_Journal({super.key});

  @override
  State<Page_Journal> createState() => _Page_JournalState();
}

class _Page_JournalState extends State<Page_Journal>
{
  List<TimelineData> data_timeline_copy = [];
  List<JournalData> data_journal_copy = [];

  // Init
  @override
  void initState()
  {
    page_journal_update();
    super.initState();
  }

  Future<void> page_journal_update() async
  {
    //List<JournalData> data_journal_result = await database_journal_retrive();
    //List<Map<String, dynamic>> data_timeline_result = await database_read(data_timeline_sql);
    List<TimelineData> data_timeline_result = await database_timeline_retrive();

    setState(()
    {
      //data_journal_copy = data_journal_result;
      data_timeline_copy = data_timeline_result;
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
        title: Text("Journal"),
        actions:
        [
          IconButton
          (
            icon: Icon(Symbols.add),
            tooltip: "Add note",
            onPressed: ()
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                {
                  return Page_JournalFull();
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
          child: Stack
          (
            children:
            [
              Visibility
              (
                visible: (data_timeline_copy.isNotEmpty),
                child: ListView
                (
                  children: data_timeline_copy.map((data)
                  {
                    DateTime data_creation_time = data.creation_time;
                    return CardTimeline
                    (
                      heading: data.heading,
                      subtitle: data.type,
                      time: DateFormat("hh:mm a").format(data_creation_time),
                      date: DateFormat("dd/M/yy").format(data_creation_time)
                    );
                  }
                  ).toList(),
                ),
              ),
              Visibility
              (
                visible: (data_timeline_copy.isEmpty),
                child: Center
                (
                  child: Text("No data"),
                )
              )
            ]
          )
          /*
          child: ListView
          (

            children:
            [
              // Sample data
              CardJournal(heading: "Walk", activity: "Sport", time: "7:03 am", date: "1/9/25"),
              CardJournal(heading: "Outing with friends", activity: "Food", time: "2:05 pm", date: "2/9/25"),
              CardJournal(heading: "Badminton", activity: "Sport", time: "5:21 pm", date: "2/9/25"),
              CardJournal(heading: "Walk", activity: "Sport", time: "7:12 am", date: "3/9/25"),
              CardJournal(heading: "Feeling depressed", activity: "Mood", time: "12:15 am", date: "4/9/25"),
            ],
          ),*/
        ),
      ),
    );
  }
}
