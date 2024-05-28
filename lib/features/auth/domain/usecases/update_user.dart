import 'package:equatable/equatable.dart';
import 'package:fsphere/core/enums/update_user.dart';
import 'package:fsphere/core/usecases/usecases.dart';
import 'package:fsphere/core/utils/typedefs.dart';
import 'package:fsphere/features/auth/domain/repos/auth_repo.dart';

class UpdateUser extends UsecaseWithParams<void, UpdateUserParams> {
  const UpdateUser(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(UpdateUserParams params) =>
      _repo.updateUser(action: params.action, userData: params.userData);
}

class UpdateUserParams extends Equatable {
  const UpdateUserParams({required this.action, required this.userData});

  final UpdateUserAction action;
  final dynamic userData;

  @override
  List<Object?> get props => [action, userData];
}
