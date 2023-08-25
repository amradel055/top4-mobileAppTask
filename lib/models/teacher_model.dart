import 'dart:convert';

List<TeacherModel> teacherModelFromJson(dynamic str) => List<TeacherModel>.from(str.map((x) => TeacherModel.fromJson(x)));

String teacherModelToJson(List<TeacherModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeacherModel {
  TeacherModel({
    required this.description,
    required this.id,
    required this.image,
    required this.name,
    required this.imageLabel,
  });

  final String description;
  final int id;
  final String image;
  final String name;
  final String imageLabel;

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
    description: json["description"],
    id: json["id"],
    image: json["image"],
    name: json["name"] ?? "",
    imageLabel: json["imageLabel"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "id": id,
    "image": image,
    "name": name,
    "imageLabel": imageLabel,
  };
}
