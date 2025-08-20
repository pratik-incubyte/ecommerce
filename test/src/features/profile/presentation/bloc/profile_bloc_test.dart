import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/get_current_profile_usecase.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/update_profile_picture_usecase.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:ecommerce/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:ecommerce/src/features/profile/presentation/bloc/profile_event.dart';
import 'package:ecommerce/src/features/profile/presentation/bloc/profile_state.dart';

import 'profile_bloc_test.mocks.dart';

@GenerateMocks([
  GetCurrentProfileUseCase,
  UpdateProfileUseCase,
  UpdateProfilePictureUseCase,
  ChangePasswordUseCase,
])
void main() {
  late ProfileBloc profileBloc;
  late MockGetCurrentProfileUseCase mockGetCurrentProfile;
  late MockUpdateProfileUseCase mockUpdateProfile;
  late MockUpdateProfilePictureUseCase mockUpdateProfilePicture;
  late MockChangePasswordUseCase mockChangePassword;
  late UserEntity tUser;

  setUp(() {
    mockGetCurrentProfile = MockGetCurrentProfileUseCase();
    mockUpdateProfile = MockUpdateProfileUseCase();
    mockUpdateProfilePicture = MockUpdateProfilePictureUseCase();
    mockChangePassword = MockChangePasswordUseCase();

    profileBloc = ProfileBloc(
      getCurrentProfile: mockGetCurrentProfile,
      updateProfile: mockUpdateProfile,
      updateProfilePicture: mockUpdateProfilePicture,
      changePassword: mockChangePassword,
    );

    tUser = UserEntity(
      id: '1',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      phone: '+1234567890',
      profilePicture: 'https://example.com/profile.jpg',
      address: '123 Main St',
      city: 'New York',
      country: 'USA',
      postalCode: '10001',
      isVerified: true,
      isActive: true,
      createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
    );
  });

  group('ProfileBloc', () {
    test('initial state should be ProfileState.initial()', () {
      expect(profileBloc.state, const ProfileState.initial());
    });

    group('LoadProfileEvent', () {
      blocTest<ProfileBloc, ProfileState>(
        'should emit [loading, loaded] when profile is loaded successfully',
        build: () {
          when(mockGetCurrentProfile(any))
              .thenAnswer((_) async => Right(tUser));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.loadProfile()),
        expect: () => [
          const ProfileState.loading(),
          ProfileState.loaded(tUser),
        ],
        verify: (_) {
          verify(mockGetCurrentProfile(NoParams()));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [loading, error] when loading profile fails with ServerFailure',
        build: () {
          when(mockGetCurrentProfile(any))
              .thenAnswer((_) async => const Left(ServerFailure('Server error')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.loadProfile()),
        expect: () => [
          const ProfileState.loading(),
          const ProfileState.error(ServerFailure('Server error')),
        ],
        verify: (_) {
          verify(mockGetCurrentProfile(NoParams()));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [loading, error] when loading profile fails with AuthFailure',
        build: () {
          when(mockGetCurrentProfile(any))
              .thenAnswer((_) async => const Left(AuthFailure('User not authenticated')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.loadProfile()),
        expect: () => [
          const ProfileState.loading(),
          const ProfileState.error(AuthFailure('User not authenticated')),
        ],
        verify: (_) {
          verify(mockGetCurrentProfile(NoParams()));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [loading, error] when loading profile fails with CacheFailure',
        build: () {
          when(mockGetCurrentProfile(any))
              .thenAnswer((_) async => const Left(CacheFailure('No cached profile')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.loadProfile()),
        expect: () => [
          const ProfileState.loading(),
          const ProfileState.error(CacheFailure('No cached profile')),
        ],
        verify: (_) {
          verify(mockGetCurrentProfile(NoParams()));
        },
      );
    });

    group('UpdateProfileEvent', () {
      blocTest<ProfileBloc, ProfileState>(
        'should emit [updating, updated] when profile is updated successfully',
        build: () {
          when(mockUpdateProfile(any))
              .thenAnswer((_) async => Right(tUser));
          return profileBloc;
        },
        act: (bloc) => bloc.add(ProfileEvent.updateProfile(tUser)),
        expect: () => [
          const ProfileState.updating(),
          ProfileState.updated(tUser),
        ],
        verify: (_) {
          verify(mockUpdateProfile(any));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [updating, error] when updating profile fails with ServerFailure',
        build: () {
          when(mockUpdateProfile(any))
              .thenAnswer((_) async => const Left(ServerFailure('Server error')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(ProfileEvent.updateProfile(tUser)),
        expect: () => [
          const ProfileState.updating(),
          const ProfileState.error(ServerFailure('Server error')),
        ],
        verify: (_) {
          verify(mockUpdateProfile(any));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [updating, error] when updating profile fails with ValidationFailure',
        build: () {
          when(mockUpdateProfile(any))
              .thenAnswer((_) async => const Left(ValidationFailure('Invalid data')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(ProfileEvent.updateProfile(tUser)),
        expect: () => [
          const ProfileState.updating(),
          const ProfileState.error(ValidationFailure('Invalid data')),
        ],
        verify: (_) {
          verify(mockUpdateProfile(any));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [updating, error] when updating profile fails with NetworkFailure',
        build: () {
          when(mockUpdateProfile(any))
              .thenAnswer((_) async => const Left(NetworkFailure('No internet connection')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(ProfileEvent.updateProfile(tUser)),
        expect: () => [
          const ProfileState.updating(),
          const ProfileState.error(NetworkFailure('No internet connection')),
        ],
        verify: (_) {
          verify(mockUpdateProfile(any));
        },
      );
    });

    group('UpdateProfilePictureEvent', () {
      const imagePath = '/path/to/image.jpg';
      const imageUrl = 'https://example.com/new_image.jpg';

      blocTest<ProfileBloc, ProfileState>(
        'should emit [uploadingImage, imageUploaded, loaded] when profile picture is updated successfully',
        build: () {
          when(mockUpdateProfilePicture(any))
              .thenAnswer((_) async => const Right(imageUrl));
          when(mockGetCurrentProfile(any))
              .thenAnswer((_) async => Right(tUser));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.updateProfilePicture(imagePath)),
        expect: () => [
          const ProfileState.uploadingImage(),
          const ProfileState.imageUploaded(imageUrl),
          ProfileState.loaded(tUser),
        ],
        verify: (_) {
          verify(mockUpdateProfilePicture(any));
          verify(mockGetCurrentProfile(NoParams()));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [uploadingImage, error] when updating profile picture fails with ServerFailure',
        build: () {
          when(mockUpdateProfilePicture(any))
              .thenAnswer((_) async => const Left(ServerFailure('Upload failed')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.updateProfilePicture(imagePath)),
        expect: () => [
          const ProfileState.uploadingImage(),
          const ProfileState.error(ServerFailure('Upload failed')),
        ],
        verify: (_) {
          verify(mockUpdateProfilePicture(any));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [uploadingImage, error] when updating profile picture fails with ValidationFailure',
        build: () {
          when(mockUpdateProfilePicture(any))
              .thenAnswer((_) async => const Left(ValidationFailure('Invalid image format')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.updateProfilePicture(imagePath)),
        expect: () => [
          const ProfileState.uploadingImage(),
          const ProfileState.error(ValidationFailure('Invalid image format')),
        ],
        verify: (_) {
          verify(mockUpdateProfilePicture(any));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [uploadingImage, error] when updating profile picture fails with NetworkFailure',
        build: () {
          when(mockUpdateProfilePicture(any))
              .thenAnswer((_) async => const Left(NetworkFailure('No internet connection')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.updateProfilePicture(imagePath)),
        expect: () => [
          const ProfileState.uploadingImage(),
          const ProfileState.error(NetworkFailure('No internet connection')),
        ],
        verify: (_) {
          verify(mockUpdateProfilePicture(any));
        },
      );
    });

    group('ChangePasswordEvent', () {
      const currentPassword = 'currentPassword123';
      const newPassword = 'newPassword456';

      blocTest<ProfileBloc, ProfileState>(
        'should emit [changingPassword, passwordChanged] when password is changed successfully',
        build: () {
          when(mockChangePassword(any))
              .thenAnswer((_) async => const Right(unit));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        )),
        expect: () => [
          const ProfileState.changingPassword(),
          const ProfileState.passwordChanged(),
        ],
        verify: (_) {
          verify(mockChangePassword(any));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [changingPassword, error] when changing password fails with AuthFailure',
        build: () {
          when(mockChangePassword(any))
              .thenAnswer((_) async => const Left(AuthFailure('Current password is incorrect')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        )),
        expect: () => [
          const ProfileState.changingPassword(),
          const ProfileState.error(AuthFailure('Current password is incorrect')),
        ],
        verify: (_) {
          verify(mockChangePassword(any));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [changingPassword, error] when changing password fails with ValidationFailure',
        build: () {
          when(mockChangePassword(any))
              .thenAnswer((_) async => const Left(ValidationFailure('Password too weak')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        )),
        expect: () => [
          const ProfileState.changingPassword(),
          const ProfileState.error(ValidationFailure('Password too weak')),
        ],
        verify: (_) {
          verify(mockChangePassword(any));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [changingPassword, error] when changing password fails with ServerFailure',
        build: () {
          when(mockChangePassword(any))
              .thenAnswer((_) async => const Left(ServerFailure('Server error')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        )),
        expect: () => [
          const ProfileState.changingPassword(),
          const ProfileState.error(ServerFailure('Server error')),
        ],
        verify: (_) {
          verify(mockChangePassword(any));
        },
      );
    });

    group('DeleteProfileEvent', () {
      blocTest<ProfileBloc, ProfileState>(
        'should emit [deleting, deleted] when delete profile is called',
        build: () => profileBloc,
        act: (bloc) => bloc.add(const ProfileEvent.deleteProfile()),
        expect: () => [
          const ProfileState.deleting(),
          const ProfileState.deleted(),
        ],
      );
    });

    group('RefreshProfileEvent', () {
      blocTest<ProfileBloc, ProfileState>(
        'should emit [loaded] when refreshing profile successfully (no loading state)',
        build: () {
          when(mockGetCurrentProfile(any))
              .thenAnswer((_) async => Right(tUser));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.refreshProfile()),
        expect: () => [
          ProfileState.loaded(tUser),
        ],
        verify: (_) {
          verify(mockGetCurrentProfile(NoParams()));
        },
      );

      blocTest<ProfileBloc, ProfileState>(
        'should emit [error] when refreshing profile fails',
        build: () {
          when(mockGetCurrentProfile(any))
              .thenAnswer((_) async => const Left(ServerFailure('Server error')));
          return profileBloc;
        },
        act: (bloc) => bloc.add(const ProfileEvent.refreshProfile()),
        expect: () => [
          const ProfileState.error(ServerFailure('Server error')),
        ],
        verify: (_) {
          verify(mockGetCurrentProfile(NoParams()));
        },
      );
    });

    group('state transitions', () {
      blocTest<ProfileBloc, ProfileState>(
        'should handle multiple state transitions correctly',
        build: () {
          when(mockGetCurrentProfile(any))
              .thenAnswer((_) async => Right(tUser));
          when(mockUpdateProfile(any))
              .thenAnswer((_) async => Right(tUser));
          return profileBloc;
        },
        act: (bloc) {
          bloc.add(const ProfileEvent.loadProfile());
          bloc.add(ProfileEvent.updateProfile(tUser));
          bloc.add(const ProfileEvent.refreshProfile());
        },
        expect: () => [
          const ProfileState.loading(),
          ProfileState.loaded(tUser),
          const ProfileState.updating(),
          ProfileState.updated(tUser),
          ProfileState.loaded(tUser),
        ],
      );

      blocTest<ProfileBloc, ProfileState>(
        'should handle error followed by successful operation',
        build: () {
          when(mockGetCurrentProfile(any))
              .thenAnswer((_) async => const Left(ServerFailure('Server error')));
          when(mockUpdateProfile(any))
              .thenAnswer((_) async => Right(tUser));
          return profileBloc;
        },
        act: (bloc) {
          bloc.add(const ProfileEvent.loadProfile());
          bloc.add(ProfileEvent.updateProfile(tUser));
        },
        expect: () => [
          const ProfileState.loading(),
          const ProfileState.error(ServerFailure('Server error')),
          const ProfileState.updating(),
          ProfileState.updated(tUser),
        ],
      );
    });
  });
}
