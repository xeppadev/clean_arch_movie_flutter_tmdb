import 'package:equatable/equatable.dart';

class EpisodeDetailEntity extends Equatable {
  final int? id;
  final int? number;
  final int? season;
  final String? name;
  final int? runtime;
  final String? stillPath;
  final String? airDate;

  const EpisodeDetailEntity({
    required this.id,
    required this.number,
    required this.season,
    required this.name,
    required this.runtime,
    required this.stillPath,
    required this.airDate,
  });

  @override
  List<Object?> get props => [
        id,
        number,
        season,
        name,
        runtime,
        stillPath,
        airDate,
      ];
}
