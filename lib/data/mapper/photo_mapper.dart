import 'package:flutter_image_search/data/dto/photo_result_dto.dart';
import 'package:flutter_image_search/data/model/photo.dart';

extension ToPhoto on Hits {
  Photo toPhoto() {
    return Photo(
      id: id!.toInt(),
      url: previewURL ?? '',
      largeImageUrl: largeImageURL ?? '',
      tags: tags ?? '',
    );
  }
}
