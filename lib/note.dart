class Note {
  final int id;
  final String title;
  final String content;
  final int? themeId;
  Note({
    required this.id,
    required this.title,
    required this.content,
    this.themeId,
  });

  factory Note.fromMap(Map<String, dynamic> map) => Note(
    id: map['id'] as int,
    title: map['title'] as String,
    content: map['content'] as String,
    themeId: map['themeId'] as int?,
  );
}
