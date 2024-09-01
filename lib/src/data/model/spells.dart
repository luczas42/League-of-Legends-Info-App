import 'package:variables/src/data/model/image_model.dart';
import 'package:variables/src/domain/entities/spells.dart';

class SpellsModel extends Spells {
  SpellsModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.image});

  factory SpellsModel.fromJson(Map<String, dynamic> json) {
    return SpellsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: ImageModel.fromJson(json['image']),
    );
  }
}
