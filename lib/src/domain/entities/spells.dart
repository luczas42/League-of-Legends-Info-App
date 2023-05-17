import 'package:variables/src/domain/entities/image.dart';

class Spells {
  final String? id;
  final String? name;
  final String? description;
  final ImageClass? image;

  Spells(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});
}
