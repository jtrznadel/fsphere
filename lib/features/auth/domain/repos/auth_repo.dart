import 'package:fsphere/core/enums/update_user.dart';
import 'package:fsphere/core/utils/typedefs.dart';
import 'package:fsphere/features/auth/domain/entities/user.dart';

abstract class AuthRepo {
  const AuthRepo();

  ResultFuture<LocalUser> signIn({
    required String email,
    required String password,
  });

  ResultFuture<void> signUp({
    required String email,
    required String fullName,
    required String password,
    required String nationality,
    required DateTime birthDate,
  });

  ResultFuture<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  });
}
