import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable()
class VideoModel extends Equatable with EntityConvertible<VideoModel, VideoEntity> {
  final String? key;

  const VideoModel({
    this.key,
  });

  //Factory Constructor para procesar el JSON:
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List<dynamic>;

    // Filtramos el primer resultado cuyo 'site' sea 'YouTube'
    // y el 'type' sea igual a "Trailer" o "Teaser":
    final youtubeVideo = results.firstWhere(
      (result) => result['site'] == 'YouTube' && 
                  (result['type'] == 'Trailer'),
      orElse:() => null,
    );

    //Extraemos la 'key' del resultado de Youtube:
    final key = youtubeVideo != null ? youtubeVideo['key'] as String? : null;

    return VideoModel(
      key: key,
    );
  }

  @override
  VideoEntity toEntity() => VideoEntity(
    key: key,
  );

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);

  @override
  List<Object?> get props => [key];
}