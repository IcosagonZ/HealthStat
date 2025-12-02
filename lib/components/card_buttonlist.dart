import 'package:flutter/material.dart';

class CardButtonList extends StatefulWidget
{
  final String heading;
  final List <String> data_values;

  const CardButtonList({
    Key? key,
    required this.heading,
    required this.data_values,
  }) : super(key: key);

  @override
  State<CardButtonList> createState() => _CardButtonListState();
}

class _CardButtonListState extends State<CardButtonList>
{
  //final String heading;
  //final String activity;

  // Test data
  /*
  final List <String> data_grid_values = const [
    "Apple",
    "Orange",
    "Banana",
    "Grape",
    "Watermelon",
    "Tomato",
    "Pumpkin",
    "Apple",
    "Orange",
    "Banana",
    "Grape",
    "Watermelon",
    "Tomato",
    "Pumpkin"
  ];*/

  String? data_list_selected;

  @override
  Widget build(BuildContext context)
  {
    // Default theme variables
    final color_scheme = Theme.of(context).colorScheme;
    final text_theme = Theme.of(context).textTheme;

    Color color_primary = color_scheme.primary;
    Color color_secondary = color_scheme.secondary;
    Color color_onprimary = color_scheme.onPrimary;
    //Color color_onsecondary = color_scheme.onSecondary;
    Color color_background = color_scheme.onBackground;
    Color color_surface = color_scheme.onSurface;

    //final style_displaylarge = text_theme.displayLarge;
    //final style_displaymedium = text_theme.displayMedium;
    //final style_displaysmall = text_theme.displaySmall;

    //final style_headlinelarge = text_theme.headlineLarge;
    //final style_headlinemedium = text_theme.headlineMedium;
    final style_headlinesmall = text_theme.headlineSmall;

    final style_titlelarge = text_theme.titleLarge;
    //final style_titlemedium = text_theme.titleMedium;
    //final style_titlesmall = text_theme.titleSmall;

    return Center
    (
      child: Card.outlined
      (
        //clipBehavior: Clip.hardEdge,
        child: InkWell
        (
          child: Row
          (
            children:
            [
              Expanded
              (
                child: Padding
                (
                  padding: EdgeInsets.all(16),
                  child: Column
                  (
                    children:
                    [
                      Expanded
                      (
                        child: ListView
                        (
                          children: widget.data_values.map((data_value)
                            {
                              return ElevatedButton
                              (
                                child: Text(data_value),
                                onPressed: ()
                                {
                                  setState(()
                                  {
                                    data_list_selected = data_value;
                                  }
                                  );
                                }
                              );
                            }
                          ).toList(),
                        )
                      ),
                    ]
                  )
                )
              ),
            ],
           ),
        ),
      ),
    );
  }
}
