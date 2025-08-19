import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadProfile() = _LoadProfile;
  const factory ProfileEvent.updateProfile(UserEntity user) = _UpdateProfile;
  const factory ProfileEvent.updateProfilePicture(String imagePath) = _UpdateProfilePicture;
  const factory ProfileEvent.changePassword({
    required String currentPassword,
    required String newPassword,
  }) = _ChangePassword;
  const factory ProfileEvent.deleteProfile() = _DeleteProfile;
  const factory ProfileEvent.refreshProfile() = _RefreshProfile;
}
