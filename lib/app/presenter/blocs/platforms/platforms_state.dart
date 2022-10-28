import 'package:equatable/equatable.dart';

abstract class PlatformsState extends Equatable {
  const PlatformsState();
}

class PlatformsInitialState extends PlatformsState {
  @override
  List<Object> get props => [];
}

class PlatformsLoadingState extends PlatformsState {
  @override
  List<Object> get props => [];
}

class PlatformsSuccessState extends PlatformsState {
  @override
  List<Object> get props => [];
}

class PlatformsErrorState extends PlatformsState {
  final String error;

  const PlatformsErrorState(this.error);

  @override
  List<Object> get props => [error];
}