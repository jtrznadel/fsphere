import 'package:fsphere/core/usecases/usecases.dart';
import 'package:fsphere/core/utils/typedefs.dart';
import 'package:fsphere/features/on_boarding/domain/repos/on_boarding_repo.dart';

class SetFirstLaunch extends UsecaseWithoutParams<void> {
  const SetFirstLaunch(this._repo);

  final OnBoardingRepo _repo;

  @override
  ResultFuture<void> call() async => _repo.setFirstLaunch();
}
