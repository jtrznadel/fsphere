import 'package:dartz/dartz.dart';
import 'package:fsphere/core/enums/update_user.dart';
import 'package:fsphere/core/errors/exceptions.dart';
import 'package:fsphere/core/errors/failures.dart';
import 'package:fsphere/core/utils/typedefs.dart';
import 'package:fsphere/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fsphere/features/auth/domain/entities/user.dart';
import 'package:fsphere/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<LocalUser> signIn(
      {required String email, required String password}) async {
    try {
      final result = await _remoteDataSource.signIn(
        email: email,
        password: password,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<void> signUp(
      {required String email,
      required String fullName,
      required String password,
      required String nationality,
      required DateTime birthDate}) async {
    try {
      await _remoteDataSource.signUp(
        email: email,
        password: password,
        fullName: fullName,
        nationality: nationality,
        birthDate: birthDate,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<void> updateUser(
      {required UpdateUserAction action, required userData}) async {
    try {
      await _remoteDataSource.updateUser(
        action: action,
        userData: userData,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
