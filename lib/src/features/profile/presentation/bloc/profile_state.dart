import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loaded(UserEntity user) = _Loaded;
  const factory ProfileState.updating() = _Updating;
  const factory ProfileState.updated(UserEntity user) = _Updated;
  const factory ProfileState.uploadingImage() = _UploadingImage;
  const factory ProfileState.imageUploaded(String imageUrl) = _ImageUploaded;
  const factory ProfileState.changingPassword() = _ChangingPassword;
  const factory ProfileState.passwordChanged() = _PasswordChanged;
  const factory ProfileState.deleting() = _Deleting;
  const factory ProfileState.deleted() = _Deleted;
  const factory ProfileState.error(Failure failure) = _Error;
}
