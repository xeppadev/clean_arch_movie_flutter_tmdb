import 'package:equatable/equatable.dart';

class GenerosEntity extends Equatable {
  final int? id;
  final String? name;

  const GenerosEntity({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
