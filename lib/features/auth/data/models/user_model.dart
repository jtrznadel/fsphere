import 'package:equatable/equatable.dart';
import 'package:fsphere/core/utils/typedefs.dart';
import 'package:fsphere/features/auth/domain/entities/user.dart';

class LocalUserModel extends LocalUser {
  const LocalUserModel({
    required super.uid,
    required super.email,
    super.profilePic,
    super.bio,
    required super.fullName,
    required super.nationality,
    required super.birthDate,
    super.following,
    super.followers,
  });

  factory LocalUserModel.empty() {
    return LocalUserModel(
      uid: 'empty.uid',
      email: 'empty.email',
      fullName: 'empty.fullName',
      nationality: 'empty.nationality',
      birthDate: DateTime.now().subtract(const Duration(days: 7000)),
    );
  }

  LocalUserModel copyWith({
    String? uid,
    String? email,
    String? profilePic,
    String? bio,
    String? fullName,
    String? nationality,
    DateTime? birthDate,
    List<String>? following,
    List<String>? followers,
  }) {
    return LocalUserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      nationality: nationality ?? this.nationality,
      birthDate: birthDate ?? this.birthDate,
      bio: bio ?? this.bio,
      profilePic: profilePic ?? this.profilePic,
      following: following ?? this.following,
      followers: followers ?? this.followers,
    );
  }

  LocalUserModel.fromMap(DataMap map)
      : super(
          uid: map['uid'] as String,
          email: map['email'] as String,
          fullName: map['fullName'] as String,
          nationality: map['nationality'] as String,
          birthDate: map['birthDate'] as DateTime,
          profilePic: map['profilePic'] as String?,
          bio: map['bio'] as String?,
          following: (map['following'] as List<dynamic>).cast<String>(),
          followers: (map['followers'] as List<dynamic>).cast<String>(),
        );

  DataMap toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'nationality': nationality,
      'birthDate': birthDate,
      'profilePic': profilePic,
      'bio': bio,
      'following': following,
      'followers': followers,
    };
  }
}
