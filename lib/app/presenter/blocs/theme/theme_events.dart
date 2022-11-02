import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class InitialThemeEvent extends ThemeEvent {
  @override
  List<Object?> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  @override
  List<Object?> get props => [];
}
