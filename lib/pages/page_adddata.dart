import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'page_overview.dart';
import '../components/card_buttongrid.dart';

class Page_AddData extends StatefulWidget
{
  final String data_type;

  const Page_AddData({
    Key? key,
    required this.data_type,
  }) : super(key: key);

  @override
  State<Page_AddData> createState() => _Page_AddDataState();
}

class _Page_AddDataState extends State<Page_AddData> with SingleTickerProviderStateMixin
{
  // INTERNAL LOGIC VARIABLES
  // Dropdown for data type
  final List<String> data_types = [
    "Calorie",
    "Height",
    "Journal",
    "Mood",
    "Sports",
    "Weight",
  ];

  String? data_type_selected;

  // Time picker variables
  TimeOfDay? data_time_selected;

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

  // TAB LOGIC VARIABLES
  late TabController tab_controller_type;

  @override
  void initState()
  {
    super.initState();
    tab_controller_type = TabController(length: 6, vsync: this);
  }

  @override
  void dispose()
  {
    tab_controller_type.dispose();
    super.dispose();
  }

  void tab_type_goto(int index)
  {
    tab_controller_type.animateTo(index);
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
        title: Text("Add data"),
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
              Row
              (
                children:
                [
                  Text("Data type"),
                  SizedBox(width: 16),
                  DropdownButton<String>
                  (
                    hint: Text("Select data type"),
                    value: data_type_selected,
                    onChanged: (String? newValue)
                    {
                      setState(()
                      {
                        data_type_selected = newValue;
                        debugPrint(data_type_selected);
                      }
                      );
                    },
                    items: data_types.map<DropdownMenuItem<String>>((String data_type_i)
                      {
                        return DropdownMenuItem<String>
                        (
                          value: data_type_i,
                          child: Text(data_type_i),
                        );
                      }
                    ).toList(),
                  ),
                ]
              ),

              SizedBox(height: 16),

              SizedBox(
                height: 300,
                child: TabBarView
                (
                  controller: tab_controller_type,
                  children:
                  [
                    Center(child:
                      CardButtonGrid()
                    ),
                    Center(child:
                      Text("Meow 2")
                    ),
                    Center(child:
                      Text("Meow 3")
                    ),
                    Center(child:
                      Text("Meow 4")
                    ),
                    Center(child:
                      Text("Meow 5")
                    ),
                    Center(child:
                      Text("Meow 6")
                    ),
                  ],
                )
              ),

              SizedBox(height: 16),

              Row
              (
                children:
                [
                  Text("Time"),
                  SizedBox(width: 16),
                  ElevatedButton
                  (
                    onPressed: () => data_time_select(context),
                    child: Text
                    (
                      data_time_selected == null
                      ? "Select time"
                      : "${data_time_selected!.format(context)}"
                    ),
                  ),
                ]
              ),

              SizedBox(height: 16),

              Row
              (
                children:
                [
                  Text("Date"),
                  SizedBox(width: 16),
                  ElevatedButton
                  (
                    onPressed: () => data_date_select(context),
                    child: Text
                    (
                      data_date_selected == null
                      ? "Select date"
                      : "${data_date_selected!.toLocal()}".split(" ")[0],
                    ),
                  ),
                ]
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea
      (
        child: Container
        (
          padding: const EdgeInsets.all(16),
          child: ElevatedButton
          (
            child: Text
            (
              "Add data"
            ),
            onPressed: ()
            {

            },
          )
        ),
      )
    );
  }
}
