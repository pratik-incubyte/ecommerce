import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/profile/presentation/bloc/profile_event.dart';

void main() {
  group('ProfileEvent', () {
    late UserEntity tUser;

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
    });

    group('LoadProfile', () {
      test('should create a LoadProfile event', () {
        const event = ProfileEvent.loadProfile();
        expect(event, isA<ProfileEvent>());
        expect(event.toString(), contains('loadProfile'));
      });

      test('should be equal for same event type', () {
        const event1 = ProfileEvent.loadProfile();
        const event2 = ProfileEvent.loadProfile();
        expect(event1, equals(event2));
      });

      test('should have consistent hashCode', () {
        const event1 = ProfileEvent.loadProfile();
        const event2 = ProfileEvent.loadProfile();
        expect(event1.hashCode, equals(event2.hashCode));
      });
    });

    group('UpdateProfile', () {
      test('should create an UpdateProfile event with user', () {
        final event = ProfileEvent.updateProfile(tUser);
        expect(event, isA<ProfileEvent>());
        expect(event.toString(), contains('updateProfile'));
        
        event.when(
          loadProfile: () => fail('Should not be LoadProfile'),
          updateProfile: (user) => expect(user, equals(tUser)),
          updateProfilePicture: (_) => fail('Should not be UpdateProfilePicture'),
          changePassword: (_, __) => fail('Should not be ChangePassword'),
          deleteProfile: () => fail('Should not be DeleteProfile'),
          refreshProfile: () => fail('Should not be RefreshProfile'),
        );
      });

      test('should be equal for same user', () {
        final event1 = ProfileEvent.updateProfile(tUser);
        final event2 = ProfileEvent.updateProfile(tUser);
        expect(event1, equals(event2));
      });

      test('should have consistent hashCode for same user', () {
        final event1 = ProfileEvent.updateProfile(tUser);
        final event2 = ProfileEvent.updateProfile(tUser);
        expect(event1.hashCode, equals(event2.hashCode));
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
        
        final event1 = ProfileEvent.updateProfile(tUser);
        final event2 = ProfileEvent.updateProfile(differentUser);
        expect(event1, isNot(equals(event2)));
      });
    });

    group('UpdateProfilePicture', () {
      test('should create an UpdateProfilePicture event with image path', () {
        const imagePath = '/path/to/image.jpg';
        const event = ProfileEvent.updateProfilePicture(imagePath);
        expect(event, isA<ProfileEvent>());
        expect(event.toString(), contains('updateProfilePicture'));
        
        event.when(
          loadProfile: () => fail('Should not be LoadProfile'),
          updateProfile: (_) => fail('Should not be UpdateProfile'),
          updateProfilePicture: (path) => expect(path, equals(imagePath)),
          changePassword: (_, __) => fail('Should not be ChangePassword'),
          deleteProfile: () => fail('Should not be DeleteProfile'),
          refreshProfile: () => fail('Should not be RefreshProfile'),
        );
      });

      test('should be equal for same image path', () {
        const imagePath = '/path/to/image.jpg';
        const event1 = ProfileEvent.updateProfilePicture(imagePath);
        const event2 = ProfileEvent.updateProfilePicture(imagePath);
        expect(event1, equals(event2));
      });

      test('should have consistent hashCode for same image path', () {
        const imagePath = '/path/to/image.jpg';
        const event1 = ProfileEvent.updateProfilePicture(imagePath);
        const event2 = ProfileEvent.updateProfilePicture(imagePath);
        expect(event1.hashCode, equals(event2.hashCode));
      });

      test('should not be equal for different image paths', () {
        const imagePath1 = '/path/to/image1.jpg';
        const imagePath2 = '/path/to/image2.jpg';
        const event1 = ProfileEvent.updateProfilePicture(imagePath1);
        const event2 = ProfileEvent.updateProfilePicture(imagePath2);
        expect(event1, isNot(equals(event2)));
      });
    });

    group('ChangePassword', () {
      test('should create a ChangePassword event with passwords', () {
        const currentPassword = 'currentPassword';
        const newPassword = 'newPassword';
        const event = ProfileEvent.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
        expect(event, isA<ProfileEvent>());
        expect(event.toString(), contains('changePassword'));
        
        event.when(
          loadProfile: () => fail('Should not be LoadProfile'),
          updateProfile: (_) => fail('Should not be UpdateProfile'),
          updateProfilePicture: (_) => fail('Should not be UpdateProfilePicture'),
          changePassword: (current, newPass) {
            expect(current, equals(currentPassword));
            expect(newPass, equals(newPassword));
          },
          deleteProfile: () => fail('Should not be DeleteProfile'),
          refreshProfile: () => fail('Should not be RefreshProfile'),
        );
      });

      test('should be equal for same passwords', () {
        const currentPassword = 'currentPassword';
        const newPassword = 'newPassword';
        const event1 = ProfileEvent.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
        const event2 = ProfileEvent.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
        expect(event1, equals(event2));
      });

      test('should have consistent hashCode for same passwords', () {
        const currentPassword = 'currentPassword';
        const newPassword = 'newPassword';
        const event1 = ProfileEvent.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
        const event2 = ProfileEvent.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
        expect(event1.hashCode, equals(event2.hashCode));
      });

      test('should not be equal for different passwords', () {
        const event1 = ProfileEvent.changePassword(
          currentPassword: 'currentPassword1',
          newPassword: 'newPassword1',
        );
        const event2 = ProfileEvent.changePassword(
          currentPassword: 'currentPassword2',
          newPassword: 'newPassword2',
        );
        expect(event1, isNot(equals(event2)));
      });
    });

    group('DeleteProfile', () {
      test('should create a DeleteProfile event', () {
        const event = ProfileEvent.deleteProfile();
        expect(event, isA<ProfileEvent>());
        expect(event.toString(), contains('deleteProfile'));
      });

      test('should be equal for same event type', () {
        const event1 = ProfileEvent.deleteProfile();
        const event2 = ProfileEvent.deleteProfile();
        expect(event1, equals(event2));
      });

      test('should have consistent hashCode', () {
        const event1 = ProfileEvent.deleteProfile();
        const event2 = ProfileEvent.deleteProfile();
        expect(event1.hashCode, equals(event2.hashCode));
      });
    });

    group('RefreshProfile', () {
      test('should create a RefreshProfile event', () {
        const event = ProfileEvent.refreshProfile();
        expect(event, isA<ProfileEvent>());
        expect(event.toString(), contains('refreshProfile'));
      });

      test('should be equal for same event type', () {
        const event1 = ProfileEvent.refreshProfile();
        const event2 = ProfileEvent.refreshProfile();
        expect(event1, equals(event2));
      });

      test('should have consistent hashCode', () {
        const event1 = ProfileEvent.refreshProfile();
        const event2 = ProfileEvent.refreshProfile();
        expect(event1.hashCode, equals(event2.hashCode));
      });
    });

    group('Event Type Distinctions', () {
      test('different event types should not be equal', () {
        const loadEvent = ProfileEvent.loadProfile();
        final updateEvent = ProfileEvent.updateProfile(tUser);
        const pictureEvent = ProfileEvent.updateProfilePicture('/path/to/image.jpg');
        const passwordEvent = ProfileEvent.changePassword(
          currentPassword: 'current',
          newPassword: 'new',
        );
        const deleteEvent = ProfileEvent.deleteProfile();
        const refreshEvent = ProfileEvent.refreshProfile();

        expect(loadEvent, isNot(equals(updateEvent)));
        expect(loadEvent, isNot(equals(pictureEvent)));
        expect(loadEvent, isNot(equals(passwordEvent)));
        expect(loadEvent, isNot(equals(deleteEvent)));
        expect(loadEvent, isNot(equals(refreshEvent)));
        
        expect(updateEvent, isNot(equals(pictureEvent)));
        expect(updateEvent, isNot(equals(passwordEvent)));
        expect(updateEvent, isNot(equals(deleteEvent)));
        expect(updateEvent, isNot(equals(refreshEvent)));
        
        expect(pictureEvent, isNot(equals(passwordEvent)));
        expect(pictureEvent, isNot(equals(deleteEvent)));
        expect(pictureEvent, isNot(equals(refreshEvent)));
        
        expect(passwordEvent, isNot(equals(deleteEvent)));
        expect(passwordEvent, isNot(equals(refreshEvent)));
        
        expect(deleteEvent, isNot(equals(refreshEvent)));
      });
    });
  });
}
