import 'package:nasa_today/features/apod/data/dto/apod_dto.dart';

class ApodModel {
  final String? date;
  final String? copyright;
  final String? explanation;
  final String? hdurl;
  final String? title;
  final String? url;
  final String? mediaType;

  ApodModel({
    this.date,
    this.mediaType,
    this.copyright,
    this.explanation,
    this.hdurl,
    this.title,
    this.url,
  });

  factory ApodModel.fromDto(ApodDto? apodDto) => ApodModel(
        date: apodDto?.date,
        copyright: apodDto?.copyright,
        explanation: apodDto?.explanation,
        hdurl: apodDto?.hdurl,
        title: apodDto?.title,
        url: apodDto?.url,
        mediaType: apodDto?.mediaType,
      );

  bool get isImage => mediaType == 'image';
}
