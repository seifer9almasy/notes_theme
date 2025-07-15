import 'package:flutter/material.dart';

import 'database.dart';
import 'note.dart';
import 'thememodel.dart';

class NoteDetailPage extends StatefulWidget {
  final Note note;
  final List<ThemeModel> themes;
  const NoteDetailPage({required this.note, required this.themes, super.key});

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late TextEditingController _contentController;
  int? selectedThemeId;

  @override
  void initState() {
    super.initState();
    _contentController = TextEditingController(text: widget.note.content);
    selectedThemeId = widget.note.themeId;
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  Future<void> saveNote() async {
    await DatabaseService.updateNote(
      widget.note.id,
      widget.note.title,
      _contentController.text,
      selectedThemeId,
    );
    Navigator.pop(
      context,
      true,
    ); // Peut renvoyer un bool pour rafraîchir la liste
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note.title),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveNote,
            tooltip: "Sauvegarder",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<int?>(
              value: selectedThemeId,
              items: [
                DropdownMenuItem(value: null, child: Text('Unclassified')),
                ...widget.themes.map(
                  (theme) => DropdownMenuItem(
                    value: theme.id,
                    child: Text(theme.name),
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedThemeId = value;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contentController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "Contenu de la note",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
