import 'package:json_annotation/json_annotation.dart';
part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final int x;
  final int y;
  final int z;

  ItemModel(this.x, this.y, this.z);

  bool isEqual(ItemModel that) {
    return (this.x == that.x && this.y == that.y && this.z == that.z);
  }

  String toString() {
    return '$x-$y-$z';
  }

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

}