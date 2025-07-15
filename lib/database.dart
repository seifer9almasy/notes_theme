import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'note.dart';
import 'thememodel.dart';

class NotesPageResult {
  final List<Note> notes;
  final bool hasMore;
  NotesPageResult(this.notes, this.hasMore);
}

class DatabaseService {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'notes.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE themes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT,
            themeId INTEGER,
            FOREIGN KEY(themeId) REFERENCES themes(id)
          )
        ''');
      },
    );
  }

  // --- THEMES ---

  static Future<List<ThemeModel>> getThemes() async {
    final db = await database;
    final maps = await db.query('themes');
    return maps
        .map((m) => ThemeModel(id: m['id'] as int, name: m['name'] as String))
        .toList();
  }

  static Future<void> addTheme(String name) async {
    final db = await database;
    await db.insert('themes', {'name': name});
  }

  static Future<void> deleteTheme(int id) async {
    final db = await database;
    await db.delete('themes', where: 'id = ?', whereArgs: [id]);
    await db.delete('notes', where: 'themeId = ?', whereArgs: [id]);
  }

  static Future<void> updateTheme(int id, String name) async {
    final db = await database;
    await db.update('themes', {'name': name}, where: 'id = ?', whereArgs: [id]);
  }

  static Future<String> exportThemesSql() async {
    final db = await database;
    final maps = await db.query('themes');
    return maps
        .map(
          (t) =>
              "INSERT INTO themes (id, name) VALUES (${t['id']}, '${t['name']}');",
        )
        .join('\n');
  }

  // --- NOTES ---

  static Future<NotesPageResult> getNotes({
    int? themeId,
    int offset = 0,
    int limit = 10,
  }) async {
    final db = await database;
    String where = '';
    List<dynamic> whereArgs = [];
    if (themeId == null) {
      where = 'themeId IS NULL';
    } else {
      where = 'themeId = ?';
      whereArgs = [themeId];
    }
    final maps = await db.query(
      'notes',
      where: where,
      whereArgs: whereArgs,
      orderBy: 'id DESC',
      limit: limit,
      offset: offset,
    );
    final total =
        Sqflite.firstIntValue(
          await db.rawQuery(
            'SELECT COUNT(*) FROM notes WHERE $where',
            whereArgs,
          ),
        ) ??
        0;
    final notes = maps
        .map(
          (m) => Note(
            id: m['id'] as int,
            title: m['title'] as String,
            content: m['content'] as String,
            themeId: m['themeId'] as int?,
          ),
        )
        .toList();
    bool hasMore = offset + limit < total;
    return NotesPageResult(notes, hasMore);
  }

  static Future<void> addNote(
    String title,
    String content,
    int? themeId,
  ) async {
    final db = await database;
    await db.insert('notes', {
      'title': title,
      'content': content,
      'themeId': themeId,
    });
  }

  static Future<void> deleteNote(int id) async {
    final db = await database;
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> updateNote(
    int id,
    String title,
    String content,
    int? themeId,
  ) async {
    final db = await database;
    await db.update(
      'notes',
      {'title': title, 'content': content, 'themeId': themeId},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<String> exportNotesSql() async {
    final db = await database;
    final maps = await db.query('notes');
    return maps
        .map(
          (n) =>
              "INSERT INTO notes (id, title, content, themeId) VALUES (${n['id']}, '${n['title']}', '${n['content']}', ${n['themeId'] ?? 'NULL'});",
        )
        .join('\n');
  }
}
