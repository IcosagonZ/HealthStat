import 'package:flutter/material.dart';

class CardButtonGrid extends StatefulWidget
{
  final String heading;
  final List <String> data_values;

  const CardButtonGrid({
    Key? key,
    required this.heading,
    required this.data_values,
  }) : super(key: key);

  @override
  State<CardButtonGrid> createState() => _CardButtonGridState();
}

class _CardButtonGridState extends State<CardButtonGrid>
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

  int? data_grid_selected_index;

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
                      Text(widget.heading),
                      SizedBox(height: 16),
                      Expanded
                      (
                        child: GridView.builder
                        (
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.data_values.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                          (
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 2.0,
                          ),
                          itemBuilder: (context, index)
                          {
                            final isSelected = data_grid_selected_index == index;
                            return ElevatedButton
                            (
                              child: Text
                              (
                                widget.data_values[index],
                                textAlign: TextAlign.center
                              ),
                              onPressed: ()
                              {
                                setState(()
                                {
                                  data_grid_selected_index = index;
                                }
                                );
                              }
                            );
                          }
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
