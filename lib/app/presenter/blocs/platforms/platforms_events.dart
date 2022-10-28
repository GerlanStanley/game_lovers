import 'package:equatable/equatable.dart';

abstract class PlatformsEvent extends Equatable {
  const PlatformsEvent();
}

class GetAllPlatformsEvent extends PlatformsEvent {
  @override
  List<Object> get props => [];
}
