import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.uid,
    required this.email,
    this.profilePic,
    this.bio,
    required this.fullName,
    required this.nationality,
    required this.birthDate,
    this.following = const [],
    this.followers = const [],
  });

  factory LocalUser.empty() {
    return LocalUser(
      uid: 'empty.uid',
      email: 'empty.email',
      fullName: 'empty.fullName',
      nationality: 'empty.nationality',
      birthDate: DateTime.now().subtract(const Duration(days: 7000)),
      profilePic: 'empty.profilePice',
      bio: 'empty.bio',
    );
  }

  final String uid;
  final String email;
  final String? profilePic;
  final String? bio;
  final String fullName;
  final String nationality;
  final DateTime birthDate;
  final List<String> following;
  final List<String> followers;

  @override
  List<Object?> get props => [uid, email];
}
