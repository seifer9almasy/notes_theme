import 'package:flutter/material.dart';

import 'database.dart';
import 'note.dart';
import 'notedetail.dart';
import 'thememodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? selectedThemeId;
  int currentPage = 0;
  List<ThemeModel> themes = [];
  List<Note> notes = [];
  bool hasMoreNotes = false;

  @override
  void initState() {
    super.initState();
    fetchThemes();
    fetchNotes();
  }

  Future<void> fetchThemes() async {
    final result = await DatabaseService.getThemes();
    setState(() {
      themes = result;
    });
  }

  Future<void> fetchNotes() async {
    final result = await DatabaseService.getNotes(
      themeId: selectedThemeId,
      offset: currentPage * 10,
      limit: 10,
    );
    setState(() {
      notes = result.notes;
      hasMoreNotes = result.hasMore;
    });
  }

  ThemeModel? getTheme(int? id) {
    return themes.firstWhere(
      (t) => t.id == id,
      orElse: () => ThemeModel(id: 0, name: "Unclassified"),
    );
  }

  Future<void> addNote() async {
    String? title = await showDialog<String>(
      context: context,
      builder: (context) {
        String t = "";
        return AlertDialog(
          title: Text("Nouvelle note"),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: "Titre"),
            onChanged: (v) => t = v,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Annuler"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, t),
              child: Text("Ajouter"),
            ),
          ],
        );
      },
    );
    if (title != null && title.isNotEmpty) {
      await DatabaseService.addNote(title, "Contenu vide", selectedThemeId);
      fetchNotes();
    }
  }

  Future<void> deleteNote() async {
    if (notes.isEmpty) return;
    final selected = await showDialog<Note>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Supprimer une note'),
        children: notes
            .map(
              (note) => SimpleDialogOption(
                child: Text(note.title),
                onPressed: () => Navigator.pop(context, note),
              ),
            )
            .toList(),
      ),
    );
    if (selected != null) {
      await DatabaseService.deleteNote(selected.id);
      fetchNotes();
    }
  }

  Future<void> addTheme() async {
    String? name = await showDialog<String>(
      context: context,
      builder: (context) {
        String t = "";
        return AlertDialog(
          title: Text("Nouveau thème"),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: "Nom"),
            onChanged: (v) => t = v,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Annuler"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, t),
              child: Text("Ajouter"),
            ),
          ],
        );
      },
    );
    if (name != null && name.isNotEmpty) {
      await DatabaseService.addTheme(name);
      fetchThemes();
    }
  }

  Future<void> deleteTheme() async {
    if (themes.isEmpty) return;
    final selected = await showDialog<ThemeModel>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Supprimer un thème'),
        children: themes
            .map(
              (theme) => SimpleDialogOption(
                child: Text(theme.name),
                onPressed: () => Navigator.pop(context, theme),
              ),
            )
            .toList(),
      ),
    );
    if (selected != null) {
      await DatabaseService.deleteTheme(selected.id);
      fetchThemes();
    }
  }

  Future<void> exportNotes() async {
    final sql = await DatabaseService.exportNotesSql();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Export SQL Notes"),
        content: SingleChildScrollView(child: Text(sql)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Fermer"),
          ),
        ],
      ),
    );
  }

  Future<void> exportThemes() async {
    final sql = await DatabaseService.exportThemesSql();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Export SQL Thèmes"),
        content: SingleChildScrollView(child: Text(sql)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Fermer"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage - Notes')),
      /*      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('AllNotes'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Themes'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Notes by theme'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),*/
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: addNote,
                            child: const Text('+'),
                          ),
                          const SizedBox(width: 4),
                          const Text('notes'),
                          const SizedBox(width: 4),
                          TextButton(
                            onPressed: deleteNote,
                            child: const Text('-'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: exportNotes,
                          child: const Text('Export'),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: addTheme,
                            child: const Text('+'),
                          ),
                          const SizedBox(width: 4),
                          const Text('themes'),
                          const SizedBox(width: 4),
                          TextButton(
                            onPressed: deleteTheme,
                            child: const Text('-'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: exportThemes,
                          child: const Text('Export'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            DropdownButton<int?>(
              value: selectedThemeId,
              items: [
                DropdownMenuItem(value: null, child: Text('Unclassified')),
                ...themes.map(
                  (theme) => DropdownMenuItem(
                    value: theme.id,
                    child: Text(theme.name),
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedThemeId = value;
                  currentPage = 0;
                  fetchNotes();
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return ListTile(
                    title: GestureDetector(
                      child: Text(
                        note.title,
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () async {
                        final updated = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                NoteDetailPage(note: note, themes: themes),
                          ),
                        );
                        if (updated == true) fetchNotes();
                      },
                    ),
                    subtitle: Text(
                      note.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: currentPage > 0
                      ? () {
                          setState(() {
                            currentPage--;
                            fetchNotes();
                          });
                        }
                      : null,
                  child: Text('Précédent'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: hasMoreNotes
                      ? () {
                          setState(() {
                            currentPage++;
                            fetchNotes();
                          });
                        }
                      : null,
                  child: Text('Suivant'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNote,
        child: Icon(Icons.add),
        tooltip: "Créer une note",
      ),
    );
  }
}
