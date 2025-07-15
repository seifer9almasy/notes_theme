class ThemeModel {
  final int id;
  final String name;
  ThemeModel({required this.id, required this.name});

  factory ThemeModel.fromMap(Map<String, dynamic> map) =>
      ThemeModel(id: map['id'] as int, name: map['name'] as String);
}
