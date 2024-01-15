import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final String categoryName;
  final String id;

  CategoryModel({
    required this.categoryName,
    required this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
    @override
  String toString() {
    // TODO: implement toString
    return "isim : $categoryName";
  }
}