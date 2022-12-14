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

class SuccessPlatformsState extends PlatformsState {
  final List<PlatformEntity> platforms;

  const SuccessPlatformsState({
    required this.platforms,
  });

  @override
  List<Object> get props => [];
}

class FailurePlatformsState extends PlatformsState {
  final String error;

  const FailurePlatformsState({required this.error});

  @override
  List<Object> get props => [error];
}
