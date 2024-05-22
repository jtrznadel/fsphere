import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fsphere/features/on_boarding/domain/usecases/is_first_launch.dart';
import 'package:fsphere/features/on_boarding/domain/usecases/set_first_launch.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit({
    required SetFirstLaunch setFirstLaunch,
    required IsFirstLaunch isFirstLaunch,
  })  : _setFirstLaunch = setFirstLaunch,
        _isFirstLaunch = isFirstLaunch,
        super(const OnBoardingInitial());

  final SetFirstLaunch _setFirstLaunch;
  final IsFirstLaunch _isFirstLaunch;

  Future<void> setFirstLaunch() async {
    final result = await _setFirstLaunch();

    result.fold(
      (failure) => emit(OnBoardingError(message: failure.message)),
      (_) => emit(const UserSet()),
    );
  }

  Future<void> isFirstLaunch() async {
    final result = await _isFirstLaunch();

    result.fold(
      (failure) => emit(OnBoardingError(message: failure.errorMessage)),
      (status) => emit(OnBoardingStatus(isFirstLaunch: status)),
    );
  }
}
