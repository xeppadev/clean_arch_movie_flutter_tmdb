import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  final int? id;
  final String? name;
  final String? profileUrl;
  final int? gender;

  const CastEntity({
    required this.id,
    required this.name,
    required this.profileUrl,
    required this.gender,
  });

  @override
  List<Object?> get props => [
        name,
        profileUrl,
        gender,
        id,
      ];
}
