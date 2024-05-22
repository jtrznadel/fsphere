import 'package:dartz/dartz.dart';
import 'package:fsphere/core/errors/exceptions.dart';
import 'package:fsphere/core/errors/failures.dart';
import 'package:fsphere/core/utils/typedefs.dart';
import 'package:fsphere/features/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:fsphere/features/on_boarding/domain/repos/on_boarding_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  const OnBoardingRepoImpl(this._localDataSource);

  final OnBoardingLocalDataSource _localDataSource;

  @override
  ResultFuture<bool> isFirstLaunch() async {
    try {
      final result = await _localDataSource.isFirstLaunch();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<void> setFirstLaunch() async {
    try {
      await _localDataSource.setFirstLaunch();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
