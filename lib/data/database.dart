class JournalData
{
  int id;
  String heading;
  String content;
  String type;
  DateTime timestamp;

  JournalData(this.id, this.heading, this.content, this.type, this.timestamp);
}

//List<JournalData> data_journal = [];

List<JournalData> data_journal =
[
  JournalData(0, "Test 1", "Hello", "Mood", DateTime.now()),
  JournalData(1, "Test 2", "Bello", "Sports", DateTime.now()),
  JournalData(2, "Test 3", "Mello", "Calorie", DateTime.now()),
];

List<JournalData> database_journal_retrive()
{
  return data_journal;
}

void database_journal_add
(
  int id,
  String heading,
  String content,
  String type,
  DateTime timestamp
)
{
  data_journal.add(JournalData
  (
    1000,
    heading,
    content,
    type,
    timestamp
  ));
}
