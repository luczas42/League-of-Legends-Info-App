import 'package:variables/src/domain/entities/image.dart';

class ImageModel extends ImageClass {
  ImageModel({required super.full});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      full: json['full'],
    );
  }
}
