part of 'on_boarding_cubit.dart';

sealed class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

final class OnBoardingInitial extends OnBoardingState {
  const OnBoardingInitial();
}

final class SettingFirstLaunch extends OnBoardingState {
  const SettingFirstLaunch();
}

final class CheckingIfUserIsFirstLauncher extends OnBoardingState {
  const CheckingIfUserIsFirstLauncher();
}

final class UserSet extends OnBoardingState {
  const UserSet();
}

final class OnBoardingStatus extends OnBoardingState {
  const OnBoardingStatus({required this.isFirstLaunch});

  final bool isFirstLaunch;

  @override
  List<bool> get props => [isFirstLaunch];
}

final class OnBoardingError extends OnBoardingState {
  const OnBoardingError({required this.message});

  final String message;

  @override
  List<String> get props => [message];
}
