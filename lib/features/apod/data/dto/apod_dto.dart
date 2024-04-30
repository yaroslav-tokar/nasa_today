import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apod_dto.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class ApodDto extends Equatable {
  final String? date;
  final String? copyright;
  final String? explanation;
  final String? hdurl;
  final String? title;
  final String? url;
  @JsonKey(name: 'media_type')
  final String? mediaType;

  ApodDto({
    this.date,
    this.mediaType,
    this.copyright,
    this.explanation,
    this.hdurl,
    this.title,
    this.url,
  });

  factory ApodDto.fromJson(Map<String, dynamic> json) => _$ApodDtoFromJson(json);

  @override
  List<Object?> get props => [date];
}
