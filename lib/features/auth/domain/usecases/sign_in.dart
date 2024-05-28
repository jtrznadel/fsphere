import 'package:equatable/equatable.dart';
import 'package:fsphere/core/usecases/usecases.dart';
import 'package:fsphere/core/utils/typedefs.dart';
import 'package:fsphere/features/auth/domain/entities/user.dart';
import 'package:fsphere/features/auth/domain/repos/auth_repo.dart';

class SignIn extends UsecaseWithParams<LocalUser, SignInParams> {
  const SignIn(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<LocalUser> call(SignInParams params) => _repo.signIn(
        email: params.email,
        password: params.password,
      );
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<String> get props => [email, password];
}
