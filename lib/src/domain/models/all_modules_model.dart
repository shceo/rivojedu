class AllModulesModel {
  final String moduleId;
  final int moduleNumber;
  final String subject;

  AllModulesModel({
    required this.moduleId,
    required this.moduleNumber,
    required this.subject,
  });

  factory AllModulesModel.fromJson(Map<String, dynamic> json) {
    return AllModulesModel(
      moduleId: json['module_id'] as String? ?? "",
      moduleNumber: json['modulNumber'] as int? ?? 0,
      subject: json['subject'] as String? ?? "",
    );
  }

  factory AllModulesModel.init(){
    return AllModulesModel(
      moduleId: "",
      moduleNumber: 0,
      subject: "",
    );
  }
}
