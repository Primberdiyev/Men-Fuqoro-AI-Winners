class LawModel {
  final String lawName;
  final List<String> lawDescription;
  final String fullLaw;

  LawModel({
    required this.lawName,
    required this.lawDescription,
    required this.fullLaw,
  });

  Map<String, dynamic> toJson() {
    return {
      'lawName': lawName,
      'lawDescription': lawDescription,
      'fullLaw': fullLaw,
    };
  }

  factory LawModel.fromJson(Map<String, dynamic> json) {
    return LawModel(
      lawName: json['lawName'],
      lawDescription: List<String>.from(json['lawDescription']),
      fullLaw: json['fullLaw'],
    );
  }
}
