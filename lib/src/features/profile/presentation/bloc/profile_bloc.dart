import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/get_current_profile_usecase.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/update_profile_picture_usecase.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:ecommerce/src/features/profile/presentation/bloc/profile_event.dart';
import 'package:ecommerce/src/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetCurrentProfileUseCase getCurrentProfile;
  final UpdateProfileUseCase updateProfile;
  final UpdateProfilePictureUseCase updateProfilePicture;
  final ChangePasswordUseCase changePassword;

  ProfileBloc({
    required this.getCurrentProfile,
    required this.updateProfile,
    required this.updateProfilePicture,
    required this.changePassword,
  }) : super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.when(
        loadProfile: () => _onLoadProfile(emit),
        updateProfile: (user) => _onUpdateProfile(user, emit),
        updateProfilePicture: (imagePath) => _onUpdateProfilePicture(imagePath, emit),
        changePassword: (currentPassword, newPassword) => _onChangePassword(currentPassword, newPassword, emit),
        deleteProfile: () => _onDeleteProfile(emit),
        refreshProfile: () => _onRefreshProfile(emit),
      );
    });
  }

  Future<void> _onLoadProfile(Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    final result = await getCurrentProfile(NoParams());
    result.fold(
      (failure) => emit(ProfileState.error(failure)),
      (user) => emit(ProfileState.loaded(user)),
    );
  }

  Future<void> _onUpdateProfile(UserEntity user, Emitter<ProfileState> emit) async {
    emit(const ProfileState.updating());
    final result = await updateProfile(UpdateProfileParams(user: user));
    result.fold(
      (failure) => emit(ProfileState.error(failure)),
      (user) => emit(ProfileState.updated(user)),
    );
  }

  Future<void> _onUpdateProfilePicture(String imagePath, Emitter<ProfileState> emit) async {
    emit(const ProfileState.uploadingImage());
    final result = await updateProfilePicture(
      UpdateProfilePictureParams(imagePath: imagePath),
    );
    result.fold(
      (failure) => emit(ProfileState.error(failure)),
      (imageUrl) {
        emit(ProfileState.imageUploaded(imageUrl));
        // Refresh profile after image upload
        add(const ProfileEvent.refreshProfile());
      },
    );
  }

  Future<void> _onChangePassword(String currentPassword, String newPassword, Emitter<ProfileState> emit) async {
    emit(const ProfileState.changingPassword());
    final result = await changePassword(ChangePasswordParams(
      currentPassword: currentPassword,
      newPassword: newPassword,
    ));
    result.fold(
      (failure) => emit(ProfileState.error(failure)),
      (_) => emit(const ProfileState.passwordChanged()),
    );
  }

  Future<void> _onDeleteProfile(Emitter<ProfileState> emit) async {
    emit(const ProfileState.deleting());
    // TODO: Implement delete profile use case
    // For now, just emit deleted state
    emit(const ProfileState.deleted());
  }

  Future<void> _onRefreshProfile(Emitter<ProfileState> emit) async {
    // Don't show loading for refresh, just update silently
    final result = await getCurrentProfile(NoParams());
    result.fold(
      (failure) => emit(ProfileState.error(failure)),
      (user) => emit(ProfileState.loaded(user)),
    );
  }
}
