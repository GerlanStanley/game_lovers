import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';

abstract class PlatformsState extends Equatable {
  const PlatformsState();
}

class InitialPlatformsState extends PlatformsState {
  @override
  List<Object> get props => [];
}

class LoadingPlatformsState extends PlatformsState {
  @override
  List<Object> get props => [];
}

class LoadingMorePlatformsState extends PlatformsState {
  @override
  List<Object> get props => [];
}

class SuccessPlatformsState extends PlatformsState {
  final List<PlatformEntity> platforms;
  final bool loadLast;

  const SuccessPlatformsState({
    required this.platforms,
    this.loadLast = false,
  });

  @override
  List<Object> get props => [];
}

class FailurePlatformsState extends PlatformsState {
  final String error;

  const FailurePlatformsState(this.error);

  @override
  List<Object> get props => [error];
}

class FailureMorePlatformsState extends PlatformsState {
  final List<PlatformEntity> platforms;
  final String error;

  const FailureMorePlatformsState({
    required this.platforms,
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
