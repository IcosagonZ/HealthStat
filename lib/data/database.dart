// Database code

import 'dart:async';
import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//import 'package:fl_chart/fl_chart.dart';

// DATABASE
List<String> database_sql_commands =
[
  "create table if not exists journals (id integer primary key autoincrement, heading text, content text, type text, tags text, creation_time text)",
  "create table if not exists measurements (id integer primary key autoincrement, jid integer, type text, value integer, unit text, tags text, creation_time text)",
  "create table if not exists moods (id integer primary key autoincrement, jid integer, moods text, tags text, creation_time text)",
  "create table if not exists symptoms (id integer primary key autoincrement, jid integer, symptom text, intensity integer, resolved integer, from_duration text, to_duration text, tags text, creation_time text)",
  "create table if not exists calories (id integer primary key autoincrement, jid integer, item text, qty integer, mass int, calories int, tags text, creation_time text)",
  "create table if not exists activities (id integer primary key autoincrement, jid integer, activity text, type text, calories int, duration int, tags text, extra text, creation_time text)",
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
  List<String> tags;
  DateTime creation_time;

  JournalData(this.id, this.heading, this.content, this.type, this.tags, this.creation_time);
}

// dummy data
List<JournalData> data_journal = [];

Future<List<JournalData>> database_journal_retrive() async
{
  data_journal = [];

  /*
  final List<Map<String, dynamic>> database_result = await database_read("select * from journals");

  for (var row in database_result)
  {
    int id = row["id"] as int;
    String heading = row["heading"] as String;
    String content = row["type"] as String;
    String type = row["type"] as String;
    List<String> tags = jsonDecode(row["tags"]) as String;
    String creation_time = row["creation_time"] as String;

    data_journal.add(JournalData
    (
      id,
      heading,
      content,
      type,
      tags,
      DateTime.parse(creation)
    ));
  }*/

  return data_journal;
}

Future<void> database_journal_add
(
  int id,
  String heading,
  String content,
  String type,
  List<String> tags,
  DateTime creation_time
) async
{
  data_journal.add(JournalData
  (
    id,
    heading,
    content,
    type,
    tags,
    creation_time
  ));

  String creation_iso = creation_time.toIso8601String();
  String tags_json = jsonEncode(tags);

  await database_write('insert into journals(heading, content, type, tags, creation_time) values("$heading", "$content", "$type", "$tags_json", "$creation_iso")');
}


// CALORIES
class CalorieData
{
  int id;
  int jid;
  String item;
  int qty;
  int mass; // grams
  int calories;
  List<String> tags;
  DateTime creation_time;

  CalorieData(this.id, this.jid, this.item, this.qty, this.mass, this.calories, this.tags, this.creation_time);
}

List<CalorieData> data_calories =
[
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
    return CalorieData(0, 0, "N/A", 0, 0, 0, [], DateTime.now());
  }
}

Future<void> database_calories_add
(
  int id,
  int jid,
  String item,
  int qty,
  int mass,
  int calories,
  List<String> tags,
  DateTime creation_time
) async
{
  data_calories.add(CalorieData
  (
    id,
    jid,
    item,
    qty,
    mass,
    calories,
    tags,
    creation_time
  ));

  String creation_iso = creation_time.toIso8601String();
  String tags_json = jsonEncode(tags);

  await database_write('insert into calories(jid, item, qty, mass, calories, tags, creation_time) values($jid, "$item", qty, mass, calories, "$tags_json", "$creation_iso")');
}


// ACTIVITY
class ActivityData
{
  int id;
  int jid;
  String activity;
  String type;
  int calories;
  int duration; // in seconds
  List<String> tags;
  List<String> extra; // extra info like reps, distance etc...
  DateTime creation_time;

  ActivityData(this.id, this.jid, this.activity, this.type, this.calories, this.duration, this.tags, this.extra, this.creation_time);
}

List<ActivityData> data_activities =
[
];

List<ActivityData> database_activities_retrive()
{
  return data_activities;
}

Future<void> database_activities_add
(
  int id,
  int jid,
  String activity,
  String type,
  int calories,
  int duration,
  List<String> tags,
  List<String> extra,
  DateTime creation_time
) async
{
  data_activities.add(ActivityData
  (
    id,
    jid,
    activity,
    type,
    calories,
    duration,
    tags,
    extra,
    creation_time
  ));

  String creation_iso = creation_time.toIso8601String();
  String tags_json = jsonEncode(tags);
  String extra_json = jsonEncode(extra);

  await database_write('insert into activities(jid, activity, type, calories, duration, "$tags", "$extra", "$creation_iso") values($jid, "$activity", "$type", calories, duration, "$tags_json", "$extra_json", "$creation_iso")');
}


// MENTAL HEALTH
class MoodData
{
  int id;
  int jid;
  List<String> moods;
  List<String> tags;
  DateTime creation_time;

  MoodData(this.id, this.jid, this.moods, this.tags, this.creation_time);
}

List<MoodData> data_moods =
[
];

List<MoodData> database_moods_retrive()
{
  return data_moods;
}

Future<void> database_moods_add
(
  int id,
  int jid,
  List<String> moods,
  List<String> tags,
  DateTime creation_time
) async
{
  data_moods.add(MoodData
  (
    id,
    jid,
    moods,
    tags,
    creation_time
  ));

  String moods_json = jsonEncode(moods);
  String tags_json = jsonEncode(tags);
  String creation_iso = creation_time.toIso8601String();

  await database_write('insert into moods(jid, moods, tags, creation_time) values($jid, "$moods_json", "$tags_json", "$creation_iso")');
}


// BODY MEASUREMENTS
class BodyData
{
  int id;
  int jid;
  String type; // height, weight etc...
  int value;
  String unit;
  List<String> tags;
  DateTime creation_time;

  BodyData(this.id, this.jid, this.type, this.value, this.unit, this.tags, this.creation_time);
}

List<BodyData> data_body =
[
];

List<BodyData> database_body_retrive()
{
  return data_body;
}

Future<void> database_body_add
(
  int id,
  int jid,
  String type,
  int value,
  String unit,
  List<String> tags,
  DateTime creation_time
) async
{
  data_body.add(BodyData
  (
    id,
    jid,
    type,
    value,
    unit,
    tags,
    creation_time
  ));

  String tags_json = jsonEncode(tags);
  String creation_iso = creation_time.toIso8601String();

  await database_write('insert into measurements(jid, type, value, unit, tags, creation_time) values($jid, "$type", $value, "$unit", "$tags_json", "$creation_iso")');
}


// SYMPTOMS
class SymptomData
{
  int id;
  int jid;
  String symptom;
  int intensity;
  DateTime from_duration;
  DateTime to_duration;
  int is_resolved;
  DateTime creation_time;

  SymptomData(this.id, this.jid, this.symptom, this.intensity, this.from_duration, this.to_duration, this.is_resolved, this.creation_time);
}

// dummy data
List<SymptomData> data_symptoms =
[
];

List<SymptomData> database_symptoms_retrive()
{
  return data_symptoms;
}

Future<void> database_symptoms_add
(
  int id,
  int jid,
  String symptom,
  int intensity,
  DateTime from_duration,
  DateTime to_duration,
  int is_resolved,
  DateTime creation_time
) async
{
  data_symptoms.add(SymptomData
  (
    id,
    jid,
    symptom,
    intensity,
    from_duration,
    to_duration,
    is_resolved,
    creation_time
  ));

  String creation_iso = creation_time.toIso8601String();

  await database_write('insert into symptoms(jid, symptom, intensity, from_duration, to_duration, is_resolved, creation_time) values($jid, $symptom, intensity, "$from_duration", "$to_duration", $is_resolved, "$creation_iso")');
}
