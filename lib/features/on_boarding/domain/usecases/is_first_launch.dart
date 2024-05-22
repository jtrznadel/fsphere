import 'package:fsphere/core/usecases/usecases.dart';
import 'package:fsphere/core/utils/typedefs.dart';
import 'package:fsphere/features/on_boarding/domain/repos/on_boarding_repo.dart';

class IsFirstLaunch extends UsecaseWithoutParams<bool> {
  const IsFirstLaunch(this._repo);

  final OnBoardingRepo _repo;

  @override
  ResultFuture<bool> call() async => _repo.isFirstLaunch();
}
