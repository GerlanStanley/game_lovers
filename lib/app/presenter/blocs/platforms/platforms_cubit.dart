import 'package:bloc/bloc.dart';

class PlatformsCubit extends Cubit<int> {
  PlatformsCubit() : super(0);

  @override
  void increment() => emit(state+1);

}