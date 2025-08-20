import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/profile/presentation/bloc/profile_state.dart';

void main() {
  group('ProfileState', () {
    late UserEntity tUser;
    late Failure tFailure;

    setUp(() {
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

      tFailure = const ServerFailure('Server error');
    });

    group('Initial', () {
      test('should create an Initial state', () {
        const state = ProfileState.initial();
        expect(state, isA<ProfileState>());
        expect(state.toString(), contains('initial'));
      });

      test('should be equal for same state type', () {
        const state1 = ProfileState.initial();
        const state2 = ProfileState.initial();
        expect(state1, equals(state2));
      });

      test('should have consistent hashCode', () {
        const state1 = ProfileState.initial();
        const state2 = ProfileState.initial();
        expect(state1.hashCode, equals(state2.hashCode));
      });
    });

    group('Loading', () {
      test('should create a Loading state', () {
        const state = ProfileState.loading();
        expect(state, isA<ProfileState>());
        expect(state.toString(), contains('loading'));
      });

      test('should be equal for same state type', () {
        const state1 = ProfileState.loading();
        const state2 = ProfileState.loading();
        expect(state1, equals(state2));
      });

      test('should have consistent hashCode', () {
        const state1 = ProfileState.loading();
        const state2 = ProfileState.loading();
        expect(state1.hashCode, equals(state2.hashCode));
      });
    });

    group('Loaded', () {
      test('should create a Loaded state with user', () {
        final state = ProfileState.loaded(tUser);
        expect(state, isA<ProfileState>());
        expect(state.toString(), contains('loaded'));
        
        state.when(
          initial: () => fail('Should not be Initial'),
          loading: () => fail('Should not be Loading'),
          loaded: (user) => expect(user, equals(tUser)),
          updating: () => fail('Should not be Updating'),
          updated: (_) => fail('Should not be Updated'),
          uploadingImage: () => fail('Should not be UploadingImage'),
          imageUploaded: (_) => fail('Should not be ImageUploaded'),
          changingPassword: () => fail('Should not be ChangingPassword'),
          passwordChanged: () => fail('Should not be PasswordChanged'),
          deleting: () => fail('Should not be Deleting'),
          deleted: () => fail('Should not be Deleted'),
          error: (_) => fail('Should not be Error'),
        );
      });

      test('should be equal for same user', () {
        final state1 = ProfileState.loaded(tUser);
        final state2 = ProfileState.loaded(tUser);
        expect(state1, equals(state2));
      });

      test('should have consistent hashCode for same user', () {
        final state1 = ProfileState.loaded(tUser);
        final state2 = ProfileState.loaded(tUser);
        expect(state1.hashCode, equals(state2.hashCode));
      });

      test('should not be equal for different users', () {
        final differentUser = UserEntity(
          id: '2',
          email: 'different@example.com',
          firstName: 'Jane',
          lastName: 'Smith',
          isVerified: false,
          isActive: true,
          createdAt: DateTime.parse('2024-01-02T00:00:00.000Z'),
          updatedAt: DateTime.parse('2024-01-02T00:00:00.000Z'),
        );
        
        final state1 = ProfileState.loaded(tUser);
        final state2 = ProfileState.loaded(differentUser);
        expect(state1, isNot(equals(state2)));
      });
    });

    group('Updating', () {
      test('should create an Updating state', () {
        const state = ProfileState.updating();
        expect(state, isA<ProfileState>());
        expect(state.toString(), contains('updating'));
      });

      test('should be equal for same state type', () {
        const state1 = ProfileState.updating();
        const state2 = ProfileState.updating();
        expect(state1, equals(state2));
      });

      test('should have consistent hashCode', () {
        const state1 = ProfileState.updating();
        const state2 = ProfileState.updating();
        expect(state1.hashCode, equals(state2.hashCode));
      });
    });

    group('Updated', () {
      test('should create an Updated state with user', () {
        final state = ProfileState.updated(tUser);
        expect(state, isA<ProfileState>());
        expect(state.toString(), contains('updated'));
        
        state.when(
          initial: () => fail('Should not be Initial'),
          loading: () => fail('Should not be Loading'),
          loaded: (_) => fail('Should not be Loaded'),
          updating: () => fail('Should not be Updating'),
          updated: (user) => expect(user, equals(tUser)),
          uploadingImage: () => fail('Should not be UploadingImage'),
          imageUploaded: (_) => fail('Should not be ImageUploaded'),
          changingPassword: () => fail('Should not be ChangingPassword'),
          passwordChanged: () => fail('Should not be PasswordChanged'),
          deleting: () => fail('Should not be Deleting'),
          deleted: () => fail('Should not be Deleted'),
          error: (_) => fail('Should not be Error'),
        );
      });

      test('should be equal for same user', () {
        final state1 = ProfileState.updated(tUser);
        final state2 = ProfileState.updated(tUser);
        expect(state1, equals(state2));
      });

      test('should have consistent hashCode for same user', () {
        final state1 = ProfileState.updated(tUser);
        final state2 = ProfileState.updated(tUser);
        expect(state1.hashCode, equals(state2.hashCode));
      });
    });

    group('UploadingImage', () {
      test('should create an UploadingImage state', () {
        const state = ProfileState.uploadingImage();
        expect(state, isA<ProfileState>());
        expect(state.toString(), contains('uploadingImage'));
      });

      test('should be equal for same state type', () {
        const state1 = ProfileState.uploadingImage();
        const state2 = ProfileState.uploadingImage();
        expect(state1, equals(state2));
      });

      test('should have consistent hashCode', () {
        const state1 = ProfileState.uploadingImage();
        const state2 = ProfileState.uploadingImage();
        expect(state1.hashCode, equals(state2.hashCode));
      });
    });

    group('ImageUploaded', () {
      test('should create an ImageUploaded state with image URL', () {
        const imageUrl = 'https://example.com/new_image.jpg';
        const state = ProfileState.imageUploaded(imageUrl);
        expect(state, isA<ProfileState>());
        expect(state.toString(), contains('imageUploaded'));
        
        state.when(
          initial: () => fail('Should not be Initial'),
          loading: () => fail('Should not be Loading'),
          loaded: (_) => fail('Should not be Loaded'),
          updating: () => fail('Should not be Updating'),
          updated: (_) => fail('Should not be Updated'),
          uploadingImage: () => fail('Should not be UploadingImage'),
          imageUploaded: (url) => expect(url, equals(imageUrl)),
          changingPassword: () => fail('Should not be ChangingPassword'),
          passwordChanged: () => fail('Should not be PasswordChanged'),
          deleting: () => fail('Should not be Deleting'),
          deleted: () => fail('Should not be Deleted'),
          error: (_) => fail('Should not be Error'),
        );
      });

      test('should be equal for same image URL', () {
        const imageUrl = 'https://example.com/new_image.jpg';
        const state1 = ProfileState.imageUploaded(imageUrl);
        const state2 = ProfileState.imageUploaded(imageUrl);
        expect(state1, equals(state2));
      });

      test('should have consistent hashCode for same image URL', () {
        const imageUrl = 'https://example.com/new_image.jpg';
        const state1 = ProfileState.imageUploaded(imageUrl);
        const state2 = ProfileState.imageUploaded(imageUrl);
        expect(state1.hashCode, equals(state2.hashCode));
      });

      test('should not be equal for different image URLs', () {
        const imageUrl1 = 'https://example.com/image1.jpg';
        const imageUrl2 = 'https://example.com/image2.jpg';
        const state1 = ProfileState.imageUploaded(imageUrl1);
        const state2 = ProfileState.imageUploaded(imageUrl2);
        expect(state1, isNot(equals(state2)));
      });
    });

    group('ChangingPassword', () {
      test('should create a ChangingPassword state', () {
        const state = ProfileState.changingPassword();
        expect(state, isA<ProfileState>());
        expect(state.toString(), contains('changingPassword'));
      });

      test('should be equal for same state type', () {
        const state1 = ProfileState.changingPassword();
        const state2 = ProfileState.changingPassword();
        expect(state1, equals(state2));
      });

      test('should have consistent hashCode', () {
        const state1 = ProfileState.changingPassword();
        const state2 = ProfileState.changingPassword();
        expect(state1.hashCode, equals(state2.hashCode));
      });
    });

    group('PasswordChanged', () {
      test('should create a PasswordChanged state', () {
        const state = ProfileState.passwordChanged();
        expect(state, isA<ProfileState>());
        expect(state.toString(), contains('passwordChanged'));
      });

      test('should be equal for same state type', () {
        const state1 = ProfileState.passwordChanged();
        const state2 = ProfileState.passwordChanged();
        expect(state1, equals(state2));
      });

      test('should have consistent hashCode', () {
        const state1 = ProfileState.passwordChanged();
        const state2 = ProfileState.passwordChanged();
        expect(state1.hashCode, equals(state2.hashCode));
      });
    });

    group('Deleting', () {
      test('should create a Deleting state', () {
        const state = ProfileState.deleting();
        expect(state, isA<ProfileState>());
        expect(state.toString(), contains('deleting'));
      });

      test('should be equal for same state type', () {
        const state1 = ProfileState.deleting();
        const state2 = ProfileState.deleting();
        expect(state1, equals(state2));
      });

      test('should have consistent hashCode', () {
        const state1 = ProfileState.deleting();
        const state2 = ProfileState.deleting();
        expect(state1.hashCode, equals(state2.hashCode));
      });
    });

    group('Deleted', () {
      test('should create a Deleted state', () {
        const state = ProfileState.deleted();
        expect(state, isA<ProfileState>());
        expect(state.toString(), contains('deleted'));
      });

      test('should be equal for same state type', () {
        const state1 = ProfileState.deleted();
        const state2 = ProfileState.deleted();
        expect(state1, equals(state2));
      });

      test('should have consistent hashCode', () {
        const state1 = ProfileState.deleted();
        const state2 = ProfileState.deleted();
        expect(state1.hashCode, equals(state2.hashCode));
      });
    });

    group('Error', () {
      test('should create an Error state with failure', () {
        final state = ProfileState.error(tFailure);
        expect(state, isA<ProfileState>());
        expect(state.toString(), contains('error'));
        
        state.when(
          initial: () => fail('Should not be Initial'),
          loading: () => fail('Should not be Loading'),
          loaded: (_) => fail('Should not be Loaded'),
          updating: () => fail('Should not be Updating'),
          updated: (_) => fail('Should not be Updated'),
          uploadingImage: () => fail('Should not be UploadingImage'),
          imageUploaded: (_) => fail('Should not be ImageUploaded'),
          changingPassword: () => fail('Should not be ChangingPassword'),
          passwordChanged: () => fail('Should not be PasswordChanged'),
          deleting: () => fail('Should not be Deleting'),
          deleted: () => fail('Should not be Deleted'),
          error: (failure) => expect(failure, equals(tFailure)),
        );
      });

      test('should be equal for same failure', () {
        final state1 = ProfileState.error(tFailure);
        final state2 = ProfileState.error(tFailure);
        expect(state1, equals(state2));
      });

      test('should have consistent hashCode for same failure', () {
        final state1 = ProfileState.error(tFailure);
        final state2 = ProfileState.error(tFailure);
        expect(state1.hashCode, equals(state2.hashCode));
      });

      test('should not be equal for different failures', () {
        const differentFailure = NetworkFailure('Network error');
        final state1 = ProfileState.error(tFailure);
        final state2 = ProfileState.error(differentFailure);
        expect(state1, isNot(equals(state2)));
      });
    });

    group('State Type Distinctions', () {
      test('different state types should not be equal', () {
        const initialState = ProfileState.initial();
        const loadingState = ProfileState.loading();
        final loadedState = ProfileState.loaded(tUser);
        const updatingState = ProfileState.updating();
        final updatedState = ProfileState.updated(tUser);
        const uploadingImageState = ProfileState.uploadingImage();
        const imageUploadedState = ProfileState.imageUploaded('url');
        const changingPasswordState = ProfileState.changingPassword();
        const passwordChangedState = ProfileState.passwordChanged();
        const deletingState = ProfileState.deleting();
        const deletedState = ProfileState.deleted();
        final errorState = ProfileState.error(tFailure);

        final allStates = [
          initialState,
          loadingState,
          loadedState,
          updatingState,
          updatedState,
          uploadingImageState,
          imageUploadedState,
          changingPasswordState,
          passwordChangedState,
          deletingState,
          deletedState,
          errorState,
        ];

        // Check that each state is not equal to any other state
        for (int i = 0; i < allStates.length; i++) {
          for (int j = i + 1; j < allStates.length; j++) {
            expect(allStates[i], isNot(equals(allStates[j])),
                reason: 'State $i should not equal state $j');
          }
        }
      });
    });

    group('State when method', () {
      test('should execute correct callback for each state type', () {
        // Test each state executes the correct when callback
        const ProfileState.initial().when(
          initial: () => null, // This should be called
          loading: () => fail('Should not call loading'),
          loaded: (_) => fail('Should not call loaded'),
          updating: () => fail('Should not call updating'),
          updated: (_) => fail('Should not call updated'),
          uploadingImage: () => fail('Should not call uploadingImage'),
          imageUploaded: (_) => fail('Should not call imageUploaded'),
          changingPassword: () => fail('Should not call changingPassword'),
          passwordChanged: () => fail('Should not call passwordChanged'),
          deleting: () => fail('Should not call deleting'),
          deleted: () => fail('Should not call deleted'),
          error: (_) => fail('Should not call error'),
        );

        const ProfileState.loading().when(
          initial: () => fail('Should not call initial'),
          loading: () => null, // This should be called
          loaded: (_) => fail('Should not call loaded'),
          updating: () => fail('Should not call updating'),
          updated: (_) => fail('Should not call updated'),
          uploadingImage: () => fail('Should not call uploadingImage'),
          imageUploaded: (_) => fail('Should not call imageUploaded'),
          changingPassword: () => fail('Should not call changingPassword'),
          passwordChanged: () => fail('Should not call passwordChanged'),
          deleting: () => fail('Should not call deleting'),
          deleted: () => fail('Should not call deleted'),
          error: (_) => fail('Should not call error'),
        );

        ProfileState.loaded(tUser).when(
          initial: () => fail('Should not call initial'),
          loading: () => fail('Should not call loading'),
          loaded: (_) => null, // This should be called
          updating: () => fail('Should not call updating'),
          updated: (_) => fail('Should not call updated'),
          uploadingImage: () => fail('Should not call uploadingImage'),
          imageUploaded: (_) => fail('Should not call imageUploaded'),
          changingPassword: () => fail('Should not call changingPassword'),
          passwordChanged: () => fail('Should not call passwordChanged'),
          deleting: () => fail('Should not call deleting'),
          deleted: () => fail('Should not call deleted'),
          error: (_) => fail('Should not call error'),
        );

        ProfileState.error(tFailure).when(
          initial: () => fail('Should not call initial'),
          loading: () => fail('Should not call loading'),
          loaded: (_) => fail('Should not call loaded'),
          updating: () => fail('Should not call updating'),
          updated: (_) => fail('Should not call updated'),
          uploadingImage: () => fail('Should not call uploadingImage'),
          imageUploaded: (_) => fail('Should not call imageUploaded'),
          changingPassword: () => fail('Should not call changingPassword'),
          passwordChanged: () => fail('Should not call passwordChanged'),
          deleting: () => fail('Should not call deleting'),
          deleted: () => fail('Should not call deleted'),
          error: (_) => null, // This should be called
        );
      });
    });
  });
}
