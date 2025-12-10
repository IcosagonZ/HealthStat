import 'package:flutter/material.dart';

class CardTimeline extends StatelessWidget
{
  final String heading;
  final String subtitle;
  final String time;
  final String date;

  const CardTimeline({
    Key? key,
    required this.heading,
    required this.subtitle,
    required this.time,
    required this.date
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    // Default theme variables
    final color_scheme = Theme.of(context).colorScheme;
    final text_theme = Theme.of(context).textTheme;

    Color color_primary = color_scheme.primary;
    //Color color_secondary = color_scheme.secondary;
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
      child: Card
      (
        clipBehavior: Clip.hardEdge,
        child: InkWell
        (
          splashColor: color_onprimary,
          onTap: ()
          {
            //debugPrint("Note tapped");
          },
          child: Row
          (
            children:
            [
              Expanded
              (
                //width: 300,
                //height: 100,
                child: Padding
                (
                  padding: EdgeInsets.all(16),
                  child: Row
                  (
                    children:
                    [
                      Text("$subtitle", style: TextStyle(color: color_primary)),
                      Expanded(
                        child: Text(" ")
                      ),
                      Text("$heading"),
                      SizedBox(width: 16),
                      Text("$time"),
                      Text(" - "),
                      Text("$date")
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
