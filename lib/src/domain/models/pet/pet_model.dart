import 'dart:convert';
List<PetModel> petModelFromJson(String str) => List<PetModel>.from(json.decode(str).map((x) => PetModel.fromJson(x)));

String petModelToJson(List<PetModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetModel {
  final String? dogName;
  final String? description;
  final int? age;
  final String? image;

  PetModel({
    this.dogName,
    this.description,
    this.age,
    this.image,
  });

  PetModel copyWith({
    String? dogName,
    String? description,
    int? age,
    String? image,
  }) =>
      PetModel(
        dogName: dogName ?? this.dogName,
        description: description ?? this.description,
        age: age ?? this.age,
        image: image ?? this.image,
      );

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
    dogName: json["dogName"],
    description: json["description"],
    age: json["age"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "dogName": dogName,
    "description": description,
    "age": age,
    "image": image,
  };
}
