import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/use_cases.dart';

import 'theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final IGetIsDarkUseCase _getIsDarkUseCase;
  final ISaveIsDarkUseCase _saveIsDarkUseCase;

  ThemeBloc(this._getIsDarkUseCase, this._saveIsDarkUseCase)
      : super(ThemeState(isDark: false)) {
    on<InitialThemeEvent>(_onInitial);
    on<ChangeThemeEvent>(_onChange);
  }

  Future<void> _onInitial(
    InitialThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    var result = _getIsDarkUseCase();
    result.fold(
      (left) => null,
      (right) => emit(ThemeState(isDark: right)),
    );
  }

  Future<void> _onChange(
    ChangeThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    _saveIsDarkUseCase(value: !state.isDark);
    emit(ThemeState(isDark: !state.isDark));
  }
}
