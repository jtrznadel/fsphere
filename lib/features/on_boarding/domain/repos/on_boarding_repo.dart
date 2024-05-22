import 'package:fsphere/core/utils/typedefs.dart';

abstract class OnBoardingRepo {
  const OnBoardingRepo();

  ResultFuture<void> setFirstLaunch();

  ResultFuture<bool> isFirstLaunch();
}
