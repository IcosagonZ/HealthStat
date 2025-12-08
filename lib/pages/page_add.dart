import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'page_overview.dart';

import '../components/card_buttongrid.dart';
import '../components/card_buttonlist.dart';
import '../components/card_journal_full.dart';

// Data libraries
import '../data/data_activities.dart';
import '../data/data_food.dart';
import '../data/data_mood.dart';
import '../data/data_disease.dart';

// Database library
import '../data/database.dart';

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
  // Visibility variables
  bool visibility_height = false;
  bool visibility_weight = false;
  bool visibility_gridbox = false;

  // Dropdown for data type
  final List<String> data_types = [
    "Calorie",
    "Disease",
    "Height",
    //"Journal", journal is in seperate page
    "Mood",
    "Sports",
    "Weight",
  ];

  String? data_type_selected;

  // Dropdown variables for other dropdowns
  String? data_food_selected;
  String? data_mood_selected;
  String? data_activity_selected;
  String? data_disease_selected;

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
  DateTime date_data_time = DateTime.now();

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

  @override
  void initState()
  {
    super.initState();

    //debugPrint(widget.data_type);
    data_type_selected = widget.data_type;

    // Set default date and time as current
    data_time_selected = TimeOfDay.now();
    data_date_selected = DateTime.now();
  }

  @override
  void dispose()
  {
    super.dispose();
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

    // Body measurement variables
    final textfield_body_height_controller = TextEditingController();
    final textfield_body_weight_controller = TextEditingController();

    // Food variables
    final textfield_food_quantity_controller = TextEditingController();
    final textfield_food_weight_controller = TextEditingController();
    final textfield_food_calories_controller = TextEditingController();

    // Activity variables
    final textfield_activity_duration_hours_controller = TextEditingController();
    final textfield_activity_duration_mins_controller = TextEditingController();
    final textfield_activity_calories_controller = TextEditingController();

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
                  Expanded(
                    child: Text("Data type")
                  ),
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
                        //debugPrint(data_type_selected);
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

              // Height field
              Visibility(
                visible: data_type_selected=="Height",
                child: Row
                (
                  children:
                  [
                    Expanded(
                      child: Text("Height")
                    ),
                    SizedBox(width: 16),
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: textfield_body_height_controller,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(border: UnderlineInputBorder()),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text("cm"),
                  ]
                ),
              ),

              // Weight field
              Visibility(
                visible: data_type_selected=="Weight",
                child: Row
                (
                  children:
                  [
                    Expanded(
                      child: Text("Weight")
                    ),
                    SizedBox(width: 16),
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: textfield_body_weight_controller,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(border: UnderlineInputBorder()),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text("kg"),
                  ]
                ),
              ),

              // Calories
              Visibility(
                visible: data_type_selected=="Calorie",
                child: Column
                (
                  children: [
                    Row
                    (
                      children:
                      [
                        Expanded(
                          child: Text("Calorie")
                        ),
                        SizedBox(width: 16),
                        DropdownButton<String>
                        (
                          hint: Text("Select food item"),
                          value: data_food_selected,
                          onChanged: (String? newValue)
                          {
                            setState(()
                            {
                              data_food_selected = newValue;
                            });
                          },
                          items: data_food.map<DropdownMenuItem<String>>((String data_food_item){
                            return DropdownMenuItem<String>
                            (
                              value: data_food_item,
                              child: Text(data_food_item),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row
                    (
                      children:
                      [
                        Expanded(
                          child: Text("Quantity")
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            controller: textfield_food_quantity_controller,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            )
                          )
                        )
                      ]
                    ),
                    SizedBox(height: 16),
                    Row
                    (
                      children:
                      [
                        Expanded(
                          child: Text("Weight")
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            controller: textfield_food_weight_controller,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            )
                          )
                        ),
                      Text("g")
                      ]
                    ),
                    SizedBox(height: 16),
                    Row
                    (
                      children:
                      [
                        Expanded(
                          child: Text("Calories")
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            controller: textfield_food_calories_controller,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            )
                          )
                        ),
                        Text("cal")
                      ]
                    ),
                  ],
                 )
              ),

              // Disease
              Visibility(
                visible: data_type_selected=="Disease",
                child: Row
                (
                  children:
                  [
                    Expanded(
                      child: Text("Symptom")
                    ),
                    SizedBox(width: 16),
                    DropdownButton<String>
                    (
                      hint: Text("Select symptom"),
                      value: data_disease_selected,
                      onChanged: (String? newValue)
                      {
                        setState(()
                        {
                          data_disease_selected = newValue;
                        });
                      },
                      items: data_disease.map<DropdownMenuItem<String>>((String data_disease_item){
                        return DropdownMenuItem<String>
                        (
                          value: data_disease_item,
                          child: Text(data_disease_item),
                        );
                      }).toList(),
                    ),
                  ],
                )
              ),

              // Mood
              Visibility(
                visible: data_type_selected=="Mood",
                child: Row
                (
                  children:
                  [
                    Expanded(
                      child: Text("Mood")
                    ),
                    SizedBox(width: 16),
                    DropdownButton<String>
                    (
                      hint: Text("Select mood"),
                      value: data_mood_selected,
                      onChanged: (String? newValue)
                      {
                        setState(()
                        {
                          data_mood_selected = newValue;
                        });
                      },
                      items: data_mood.map<DropdownMenuItem<String>>((String data_mood_item){
                        return DropdownMenuItem<String>
                        (
                          value: data_mood_item,
                          child: Text(data_mood_item),
                        );
                      }).toList(),
                    ),
                  ],
                 )
              ),

              // Sports
              Visibility(
                visible: data_type_selected=="Sports",
                child: Column
                (
                  children:[
                    Row(
                      children:
                      [
                        Expanded(
                          child: Text("Activity")
                        ),
                        SizedBox(width: 16),
                        DropdownButton<String>
                        (
                          hint: Text("Select sports"),
                          value: data_activity_selected,
                          onChanged: (String? newValue)
                          {
                            setState(()
                            {
                              data_activity_selected = newValue;
                            });
                          },
                          items: data_activities_list.map<DropdownMenuItem<String>>((String data_activity_item){
                            return DropdownMenuItem<String>
                            (
                              value: data_activity_item,
                              child: Text(data_activity_item),
                            );
                          }).toList(),
                        ),
                      ]
                    ),
                    Row(
                      children:
                      [
                        Expanded(
                          child: Text("Duration")
                        ),
                        SizedBox(width: 16),

                        SizedBox(
                          width: 20,
                          child: TextField(
                            controller: textfield_activity_duration_hours_controller,
                            textAlign: TextAlign.center,
                            maxLength: 2,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              counterText: '',
                            )
                          )
                        ),
                        SizedBox(width: 4),
                        Text("hrs"),

                        SizedBox(width: 8),

                        SizedBox(
                          width: 20,
                          child: TextField(
                            controller: textfield_activity_duration_mins_controller,
                            textAlign: TextAlign.center,
                            maxLength: 2,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              counterText: '',
                            )
                          )
                        ),
                        SizedBox(width: 4),
                        Text("mins"),
                      ]
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Calories")
                        ),

                        SizedBox(width: 16),

                        SizedBox(
                          width: 50,
                          child: TextField(
                            controller: textfield_activity_calories_controller,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            )
                          )
                        ),
                      ]
                    )
                  ],
                 ),
              ),

              SizedBox(height: 16),

              Row
              (
                children:
                [
                  Expanded(
                    child: Text("Time")
                  ),
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
                  Expanded(
                    child: Text("Date")
                  ),
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
              print(data_type_selected);
              //print(data_time_selected);

              date_data_time = DateTime(
                data_date_selected!.year,
                data_date_selected!.month,
                data_date_selected!.day,
                data_time_selected!.hour,
                data_time_selected!.minute,
              );

              print(data_date_selected);

              if(data_type_selected=="Height")
              {
                //print(textfield_body_height_controller.text);
                database_body_add(
                  0,
                  0,
                  "Height",
                  int.parse(textfield_body_height_controller.text),
                  "cm",
                  ["manual"],
                  date_data_time
                );
              }
              if(data_type_selected=="Weight")
              {
                //print(textfield_body_weight_controller.text);
                database_body_add(
                  0,
                  0,
                  "Weight",
                  int.parse(textfield_body_weight_controller.text),
                  "kg",
                  ["manual"],
                  date_data_time
                );
              }
              if(data_type_selected=="Disease")
              {
                print(data_disease_selected);
              }
              if(data_type_selected=="Mood")
              {
                //print(data_mood_selected);
                String _data_mood_selected = data_mood_selected!;
                database_moods_add(
                  0,
                  0,
                  _data_mood_selected,
                  ["manual"],
                  date_data_time
                );
              }
              if(data_type_selected=="Calorie")
              {
                print(data_food_selected);
                print(textfield_food_quantity_controller.text);
                print(textfield_food_weight_controller.text);
                print(textfield_food_calories_controller.text);
              }
              if(data_type_selected=="Sports")
              {
                print(data_activity_selected);
                print(textfield_activity_calories_controller.text);
                print(textfield_activity_duration_hours_controller.text);
                print(textfield_activity_duration_mins_controller.text);
              }
            },
          )
        ),
      )
    );
  }
}
