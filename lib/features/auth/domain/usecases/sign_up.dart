import 'package:equatable/equatable.dart';
import 'package:fsphere/core/usecases/usecases.dart';
import 'package:fsphere/core/utils/typedefs.dart';
import 'package:fsphere/features/auth/domain/repos/auth_repo.dart';

class SignUp extends UsecaseWithParams<void, SignUpParams> {
  const SignUp(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(SignUpParams params) => _repo.signUp(
      email: params.email,
      fullName: params.fullName,
      password: params.password,
      nationality: params.nationality,
      birthDate: params.birthDate);
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.email,
    required this.password,
    required this.fullName,
    required this.nationality,
    required this.birthDate,
  });

  final String email;
  final String password;
  final String fullName;
  final String nationality;
  final DateTime birthDate;

  @override
  List<Object?> get props =>
      [email, password, fullName, nationality, birthDate];
}
