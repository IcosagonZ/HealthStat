import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';

import 'page_overview.dart';
import 'page_journal.dart';

import '../data/database.dart';

class Page_JournalFull extends StatefulWidget
{
  const Page_JournalFull({super.key});

  @override
  State<Page_JournalFull> createState() => _Page_JournalFullState();
}

class _Page_JournalFullState extends State<Page_JournalFull>
{
  // Journal entry variables
  JournalData? data_journal_entry;

  // Journal entry UI variables
  final textfield_heading_controller = TextEditingController();
  final textfield_note_controller = TextEditingController();

  // Time picker variables
  TimeOfDay? data_time_selected;

  Future<void> data_time_now() async
  {
    data_time_selected = TimeOfDay.now();
  }

  Future<void> data_time_select(BuildContext context) async
  {
    final TimeOfDay? picked_time = await showTimePicker
    (
      context: context,
      initialTime: data_time_selected ?? TimeOfDay.now(),
    );

    if(picked_time != null && picked_time != data_time_selected)
    {
      setState(()
      {
        data_time_selected = picked_time;
      }
      );
    }
  }

  // Date picker variables
  DateTime? data_date_selected;

  Future<void> data_date_now() async
  {
    data_date_selected = DateTime.now();
  }

  Future<void> data_date_select(BuildContext context) async
  {
    final DateTime? picked_date = await showDatePicker
    (
      context: context,
      initialDate: data_date_selected ?? DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );

    if(picked_date != null && picked_date != data_date_selected)
    {
      setState(()
      {
        data_date_selected = picked_date;
      }
      );
    }
  }

  // When UI ready
  @override
  void initState()
  {
    super.initState();
    data_time_now();
    data_date_now();
  }

  // Main journal UI
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
        ],
      ),
      body: SizedBox.expand
      (
        child: Padding
        (
          padding: EdgeInsets.all(16),
          child: Column
          (
            children:
            [
              TextField
              (
                controller: textfield_heading_controller,
                decoration: InputDecoration(
                hintText: "Heading",
              ),
              ),
              SizedBox(height: 16),
              Expanded
              (
                child: TextField
                (
                  controller: textfield_note_controller,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration
                  (
                    hintText: "Note",
                    border: InputBorder.none,
                  )
                )
              ),
              SizedBox(height: 8),
              Row(
                children:
                [
                  TextButton
                  (
                    onPressed: () => data_time_select(context),
                    child: Text
                    (
                      "${data_time_selected!.format(context)}"
                    ),
                  ),
                  TextButton
                  (
                    onPressed: () => data_date_select(context),
                    child: Text
                    (
                      "${data_date_selected!.toLocal()}".split(" ")[0],
                    ),
                  ),
                  Expanded
                  (
                    child: Text(" ")
                  ),
                  IconButton
                  (
                    icon: Icon(Symbols.delete),
                    onPressed: () => print("Clear"),
                    /*child: Text
                    (
                      "Clear"
                    ),*/
                  ),
                  IconButton
                  (
                    icon: Icon(Symbols.save),
                    onPressed: ()
                    {
                      database_journal_add
                      (
                        1000,
                        textfield_heading_controller.text,
                        textfield_note_controller.text,
                        "Journal",
                        ["Long"],
                        DateTime.now()
                      );
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                      {
                          return const Page_Journal();
                      }));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
