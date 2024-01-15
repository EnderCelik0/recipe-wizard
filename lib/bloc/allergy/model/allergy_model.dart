import 'package:json_annotation/json_annotation.dart';

part 'allergy_model.g.dart';

@JsonSerializable()
class AllergyModel {
  final String name;
  final String id;
  final DateTime createdDate;

  AllergyModel({
    required this.name,
    required this.id,
    required this.createdDate,
  });

  factory AllergyModel.fromJson(Map<String, dynamic> json) =>
      _$AllergyModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllergyModelToJson(this);

  @override
  String toString() {
    // TODO: implement toString
    return "isim : $name";
  }
}