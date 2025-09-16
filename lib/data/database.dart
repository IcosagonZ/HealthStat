// Database code

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:fl_chart/fl_chart.dart';

// DATABASE
List<String> database_sql_commands =
[
  "create table if not exists journal (id integer, heading text, content text, type text, creation text)"
];

Future<String> database_path() async
{
  var database_storage_path = await getDatabasesPath();
  String database_data_path =  join(database_storage_path, "healthstat.db");

  return database_data_path;
}

Future<void> database_delete() async
{
  var database_storage_path = await getDatabasesPath();
  String database_data_path =  join(database_storage_path, "healthstat.db");

  await deleteDatabase(database_data_path);
}

Future<void> database_write(String query) async
{
  var database_storage_path = await getDatabasesPath();
  String database_data_path =  join(database_storage_path, "healthstat.db");

  Database database_db = await openDatabase
  (
    database_data_path,
    version: 1,
    onCreate: (Database db, int version) async
    {
      for (var database_sql_command in database_sql_commands)
      {
        await db.execute(database_sql_command);
      }
    },
    onOpen: (Database db) async
    {
      for (var database_sql_command in database_sql_commands)
      {
        await db.execute(database_sql_command);
      }
    }
  );

  await database_db.transaction((txn) async
  {
    int result = await txn.rawInsert(query);
    print("DATABASE: Written to database ($result)");
  }
  );

  await database_db.close();
}

Future<List<Map<String, dynamic>>> database_read(String query) async
{
  var database_storage_path = await getDatabasesPath();
  String database_data_path =  join(database_storage_path, "healthstat.db");

  Database database_db = await openDatabase
  (
    database_data_path,
    version: 1,
    onCreate: (Database db, int version) async
    {
      for (var database_sql_command in database_sql_commands)
      {
        await db.execute(database_sql_command);
      }
    },
    onOpen: (Database db) async
    {
      for (var database_sql_command in database_sql_commands)
      {
        await db.execute(database_sql_command);
      }
    }
  );

  final List<Map<String, dynamic>> database_result = await database_db.rawQuery(query);

  await database_db.close();

  return database_result;
}

// JOURNAL
class JournalData
{
  int id;
  String heading;
  String content;
  String type;
  DateTime timestamp;

  JournalData(this.id, this.heading, this.content, this.type, this.timestamp);
}

// dummy data
List<JournalData> data_journal = [];

Future<List<JournalData>> database_journal_retrive() async
{
  data_journal = [];

  final List<Map<String, dynamic>> database_result = await database_read("select * from journal");

  for (var row in database_result)
  {
    int id = row["id"] as int;
    String heading = row["heading"] as String;
    String content = row["type"] as String;
    String type = row["type"] as String;
    String creation = row["creation"] as String;

    data_journal.add(JournalData
    (
      id,
      heading,
      content,
      type,
      DateTime.parse(creation)
    ));
  }

  return data_journal;
}

Future<void> database_journal_add
(
  int id,
  String heading,
  String content,
  String type,
  DateTime creation
) async
{
  data_journal.add(JournalData
  (
    id,
    heading,
    content,
    type,
    creation
  ));

  String creation_iso = creation.toIso8601String();

  await database_write('insert into journal values(1000, "$heading", "$content", "$type", "$creation_iso")');
}


// CALORIES
class CalorieData
{
  int id;
  String item;
  int quantity;
  int weight; // grams
  int calories;
  DateTime timestamp;

  CalorieData(this.id, this.item, this.quantity, this.weight, this.calories, this.timestamp);
}

// dummy data
List<CalorieData> data_calories =
[
  CalorieData(0, "Nutella sandwich", 2, 100, 200, DateTime.now()),
  CalorieData(0, "Peanut butter sandwich", 2, 100, 250, DateTime.now()),
];

List<CalorieData> database_calories_retrive()
{
  return data_calories;
}

CalorieData database_calories_recent()
{
  if(data_calories.length>0)
  {
    return data_calories[data_calories.length-1];
  }
  else
  {
    return CalorieData(0, "N/A", 0, 0, 0, DateTime.now());
  }
}

void database_calories_add
(
  int id,
  String item,
  int quantity,
  int weight,
  int calories,
  DateTime timestamp
)
{
  data_calories.add(CalorieData
  (
    id,
    item,
    quantity,
    weight,
    calories,
    timestamp
  ));
}


// ACTIVITY
class ActivityData
{
  int id;
  String activity;
  int calories;
  int duration; // in seconds
  List<int> extra; // extra info like reps, distance etc...
  DateTime timestamp;

  ActivityData(this.id, this.activity, this.calories, this.duration, this.extra, this.timestamp);
}

// dummy data
List<ActivityData> data_activities =
[
  ActivityData(0, "Swimming", 200, 2700, [200], DateTime.now()),
  ActivityData(1, "Walking", 180, 3800, [2], DateTime.now()),
  ActivityData(2, "Badminton", 350, 1800, [8], DateTime.now()),
];

List<ActivityData> database_activities_retrive()
{
  return data_activities;
}

void database_activities_add
(
  int id,
  String activity,
  int calories,
  int duration,
  List<int> extra,
  DateTime timestamp
)
{
  data_activities.add(ActivityData
  (
    id,
    activity,
    calories,
    duration,
    extra,
    timestamp
  ));
}


// MENTAL HEALTH
class MoodData
{
  int id;
  List<String> moods;
  DateTime timestamp;

  MoodData(this.id, this.moods, this.timestamp);
}

// dummy data
List<MoodData> data_moods =
[
  MoodData(0, ["Sleepy", "Tired", "Exhausted"], DateTime.now()),
  MoodData(1, ["Depressed", "Lonely"], DateTime.now()),
  MoodData(2, ["Happy", "Excited"], DateTime.now()),
  MoodData(3, ["Sad"], DateTime.now()),
];

List<MoodData> database_moods_retrive()
{
  return data_moods;
}

void database_moods_add
(
  int id,
  List<String> moods,
  DateTime timestamp
)
{
  data_moods.add(MoodData
  (
    id,
    moods,
    timestamp
  ));
}


// BODY MEASUREMENTS
class BodyData
{
  int id;
  String type; // height, weight etc...
  int value;
  DateTime timestamp;

  BodyData(this.id, this.type, this.value, this.timestamp);
}

// dummy data
List<BodyData> data_body =
[
  BodyData(0, "Height", 170, DateTime.now()),
  BodyData(1, "Weight", 55, DateTime.now()),
  BodyData(2, "Weight", 57, DateTime.now()),
  BodyData(3, "Weight", 58, DateTime.now()),
  BodyData(4, "Weight", 55, DateTime.now()),
];

List<BodyData> database_body_retrive()
{
  return data_body;
}

void database_body_add
(
  int id,
  String type,
  int value,
  DateTime timestamp
)
{
  data_body.add(BodyData
  (
    id,
    type,
    value,
    timestamp
  ));
}


// SYMPTOMS
class SymptomData
{
  int id;
  List<String> symptoms;
  DateTime timestamp;

  SymptomData(this.id, this.symptoms, this.timestamp);
}

// dummy data
List<SymptomData> data_symptoms =
[
  SymptomData(0, ["Cough", "Fever", "Headache"], DateTime.now()),
  SymptomData(1, ["Cold"], DateTime.now()),
  SymptomData(2, ["Body pain", "Headache"], DateTime.now()),
];

List<SymptomData> database_symptoms_retrive()
{
  return data_symptoms;
}

void database_symptoms_add
(
  int id,
  List<String> symptoms,
  DateTime timestamp
)
{
  data_symptoms.add(SymptomData
  (
    id,
    symptoms,
    timestamp
  ));
}
