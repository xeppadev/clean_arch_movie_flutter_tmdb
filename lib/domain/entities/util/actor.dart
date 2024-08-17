import 'package:equatable/equatable.dart';

class ActorDetailEntity extends Equatable {
  final int? id;
  final String? name;
  final String? birthday;
  final String? profileUrl;

  const ActorDetailEntity({
    this.name,
    this.profileUrl,
    this.birthday,
    this.id,
  });

  @override
  List<Object?> get props => [
        name,
        profileUrl,
        birthday,
        id,
      ];
}
