class AllLessonsModel {
  final String id;
  final int number;
  final String title;
  final String source;
  final String cover;
  final String moduleId;
  final String description;

  AllLessonsModel({
    required this.id,
    required this.number,
    required this.title,
    required this.source,
    required this.cover,
    required this.moduleId,
    required this.description,
  });

  factory AllLessonsModel.init() {
    return AllLessonsModel(
      id: '',
      number: 0,
      title: '',
      source: '',
      cover: '',
      moduleId: '',
      description: '',
    );
  }

  factory AllLessonsModel.fromJson(Map<String, dynamic> json) {
    return AllLessonsModel(
      id: json['id'] as String? ?? "",
      number: json['number'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      source: json['source'] as String? ?? "",
      cover: json['cover'] as String? ?? "",
      moduleId: json['moduleId'] as String? ?? "",
      description: json['description'] as String? ?? "",
    );
  }
}
