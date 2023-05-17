import 'package:variables/src/data/model/image_model.dart';
import 'package:variables/src/domain/entities/passive.dart';

class PassiveModel extends Passive {
  PassiveModel(
      {required super.name, required super.description, required super.image});

  factory PassiveModel.fromJson(Map<String, dynamic> json) {
    return PassiveModel(
        name: json['name'],
        description: json['description'],
        image: ImageModel.fromJson(json['image']));
  }
}
