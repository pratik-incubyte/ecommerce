import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecommerce/src/features/auth/data/models/user_model.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/auth_params.dart';

import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([FirebaseAuth, UserCredential, User, UserMetadata])
void main() {
  late AuthRemoteDataSource dataSource;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;
  late MockUserMetadata mockUserMetadata;
  late UserModel tUserModel;
  late LoginParams tLoginParams;
  late RegisterParams tRegisterParams;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    mockUserMetadata = MockUserMetadata();
    dataSource = AuthRemoteDataSourceImpl(firebaseAuth: mockFirebaseAuth);

    tUserModel = UserModel(
      id: 'user123',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      isVerified: true,
      isActive: true,
      createdAt: DateTime.parse('2024-01-01'),
      updatedAt: DateTime.parse('2024-01-01'),
    );

    tLoginParams = const LoginParams(
      email: 'test@example.com',
      password: 'password123',
    );

    tRegisterParams = const RegisterParams(
      email: 'test@example.com',
      password: 'password123',
      firstName: 'John',
      lastName: 'Doe',
    );
  });

  group('AuthRemoteDataSource', () {
    group('login', () {
      test('should return UserModel when login is successful', () async {
        // arrange
        when(
          mockFirebaseAuth.signInWithEmailAndPassword(
            email: anyNamed('email'),
            password: anyNamed('password'),
          ),
        ).thenAnswer((_) async => mockUserCredential);

        when(mockUserCredential.user).thenReturn(mockUser);
        when(mockUser.uid).thenReturn('user123');
        when(mockUser.email).thenReturn('test@example.com');
        when(mockUser.displayName).thenReturn('John Doe');
        when(mockUser.emailVerified).thenReturn(true);
        when(mockUser.metadata).thenReturn(mockUserMetadata);
        when(
          mockUserMetadata.creationTime,
        ).thenReturn(DateTime.parse('2024-01-01'));

        // act
        final result = await dataSource.login(tLoginParams);

        // assert
        expect(result, isA<UserModel>());
        expect(result.id, 'user123');
        expect(result.email, 'test@example.com');
        verify(
          mockFirebaseAuth.signInWithEmailAndPassword(
            email: 'test@example.com',
            password: 'password123',
          ),
        );
      });

      test(
        'should throw ServerException when login fails with invalid credentials',
        () async {
          // arrange
          when(
            mockFirebaseAuth.signInWithEmailAndPassword(
              email: anyNamed('email'),
              password: anyNamed('password'),
            ),
          ).thenThrow(
            FirebaseAuthException(
              code: 'invalid-credential',
              message: 'The supplied auth credential is invalid.',
            ),
          );

          // act & assert
          expect(
            () => dataSource.login(tLoginParams),
            throwsA(isA<ServerException>()),
          );
        },
      );

      test(
        'should throw ServerException when login fails with user not found',
        () async {
          // arrange
          when(
            mockFirebaseAuth.signInWithEmailAndPassword(
              email: anyNamed('email'),
              password: anyNamed('password'),
            ),
          ).thenThrow(
            FirebaseAuthException(
              code: 'user-not-found',
              message: 'No user found for that email.',
            ),
          );

          // act & assert
          expect(
            () => dataSource.login(tLoginParams),
            throwsA(isA<ServerException>()),
          );
        },
      );

      test(
        'should throw ServerException when login fails with wrong password',
        () async {
          // arrange
          when(
            mockFirebaseAuth.signInWithEmailAndPassword(
              email: anyNamed('email'),
              password: anyNamed('password'),
            ),
          ).thenThrow(
            FirebaseAuthException(
              code: 'wrong-password',
              message: 'Wrong password provided for that user.',
            ),
          );

          // act & assert
          expect(
            () => dataSource.login(tLoginParams),
            throwsA(isA<ServerException>()),
          );
        },
      );
    });

    group('register', () {
      test('should return UserModel when registration is successful', () async {
        // arrange
        when(
          mockFirebaseAuth.createUserWithEmailAndPassword(
            email: anyNamed('email'),
            password: anyNamed('password'),
          ),
        ).thenAnswer((_) async => mockUserCredential);

        when(mockUserCredential.user).thenReturn(mockUser);
        when(mockUser.uid).thenReturn('user123');
        when(mockUser.email).thenReturn('test@example.com');
        when(mockUser.displayName).thenReturn(null);
        when(mockUser.emailVerified).thenReturn(false);
        when(mockUser.metadata).thenReturn(mockUserMetadata);
        when(
          mockUserMetadata.creationTime,
        ).thenReturn(DateTime.parse('2024-01-01'));
        when(mockUser.updateDisplayName(any)).thenAnswer((_) async {});

        // act
        final result = await dataSource.register(tRegisterParams);

        // assert
        expect(result, isA<UserModel>());
        expect(result.id, 'user123');
        expect(result.email, 'test@example.com');
        expect(result.firstName, 'John');
        expect(result.lastName, 'Doe');
        verify(
          mockFirebaseAuth.createUserWithEmailAndPassword(
            email: 'test@example.com',
            password: 'password123',
          ),
        );
        verify(mockUser.updateDisplayName('John Doe'));
      });

      test(
        'should throw ServerException when registration fails with email already in use',
        () async {
          // arrange
          when(
            mockFirebaseAuth.createUserWithEmailAndPassword(
              email: anyNamed('email'),
              password: anyNamed('password'),
            ),
          ).thenThrow(
            FirebaseAuthException(
              code: 'email-already-in-use',
              message: 'The account already exists for that email.',
            ),
          );

          // act & assert
          expect(
            () => dataSource.register(tRegisterParams),
            throwsA(isA<ServerException>()),
          );
        },
      );

      test(
        'should throw ServerException when registration fails with weak password',
        () async {
          // arrange
          when(
            mockFirebaseAuth.createUserWithEmailAndPassword(
              email: anyNamed('email'),
              password: anyNamed('password'),
            ),
          ).thenThrow(
            FirebaseAuthException(
              code: 'weak-password',
              message: 'The password provided is too weak.',
            ),
          );

          // act & assert
          expect(
            () => dataSource.register(tRegisterParams),
            throwsA(isA<ServerException>()),
          );
        },
      );
    });

    group('logout', () {
      test('should complete successfully when logout is successful', () async {
        // arrange
        when(mockFirebaseAuth.signOut()).thenAnswer((_) async {});

        // act
        await dataSource.logout();

        // assert
        verify(mockFirebaseAuth.signOut());
      });

      test('should throw ServerException when logout fails', () async {
        // arrange
        when(mockFirebaseAuth.signOut()).thenThrow(Exception('Logout failed'));

        // act & assert
        expect(() => dataSource.logout(), throwsA(isA<ServerException>()));
      });
    });

    group('getCurrentUser', () {
      test('should return UserModel when user is authenticated', () async {
        // arrange
        when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(mockUser.uid).thenReturn('user123');
        when(mockUser.email).thenReturn('test@example.com');
        when(mockUser.displayName).thenReturn('John Doe');
        when(mockUser.emailVerified).thenReturn(true);
        when(mockUser.metadata).thenReturn(mockUserMetadata);
        when(
          mockUserMetadata.creationTime,
        ).thenReturn(DateTime.parse('2024-01-01'));

        // act
        final result = await dataSource.getCurrentUser();

        // assert
        expect(result, isA<UserModel>());
        expect(result!.id, 'user123');
        expect(result.email, 'test@example.com');
      });

      test('should return null when no user is authenticated', () async {
        // arrange
        when(mockFirebaseAuth.currentUser).thenReturn(null);

        // act
        final result = await dataSource.getCurrentUser();

        // assert
        expect(result, null);
      });
    });

    group('isAuthenticated', () {
      test('should return true when user is authenticated', () async {
        // arrange
        when(mockFirebaseAuth.currentUser).thenReturn(mockUser);

        // act
        final result = await dataSource.isAuthenticated();

        // assert
        expect(result, true);
      });

      test('should return false when no user is authenticated', () async {
        // arrange
        when(mockFirebaseAuth.currentUser).thenReturn(null);

        // act
        final result = await dataSource.isAuthenticated();

        // assert
        expect(result, false);
      });
    });
  });
}
