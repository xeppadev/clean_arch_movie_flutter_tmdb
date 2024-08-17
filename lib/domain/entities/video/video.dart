import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String? key;

  const VideoEntity ({
    this.key,
  });

  @override
  List<Object?> get props => [
    key,
  ];
}
