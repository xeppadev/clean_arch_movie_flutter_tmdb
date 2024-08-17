part of 'toggle_media_cubit.dart';

sealed class ToggleMediaState extends Equatable{
  const ToggleMediaState();

  @override
  List<Object> get props => [];
}

final class ToggleMediaInitial extends ToggleMediaState {
  const ToggleMediaInitial();
}

final class ToggleMediaLoading extends ToggleMediaState {
  const ToggleMediaLoading();
}

final class ToggleMediaSuccess extends ToggleMediaState {
  const ToggleMediaSuccess();
}


final class ToggleMediaError extends ToggleMediaState {
  final String message;

  const ToggleMediaError(this.message);

  @override
  List<Object> get props => [message];
}