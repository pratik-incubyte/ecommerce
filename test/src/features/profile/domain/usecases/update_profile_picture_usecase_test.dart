import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/update_profile_picture_usecase.dart';

import 'update_profile_picture_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late UpdateProfilePictureUseCase usecase;
  late MockProfileRepository mockProfileRepository;
  late UpdateProfilePictureParams tParams;
  late String tImagePath;
  late String tImageUrl;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    usecase = UpdateProfilePictureUseCase(mockProfileRepository);
    tImagePath = '/path/to/image.jpg';
    tImageUrl = 'https://example.com/uploaded_image.jpg';
    tParams = UpdateProfilePictureParams(imagePath: tImagePath);
  });

  group('UpdateProfilePictureUseCase', () {
    test('should update profile picture through the repository', () async {
      // arrange
      when(mockProfileRepository.updateProfilePicture(any))
          .thenAnswer((_) async => Right(tImageUrl));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, Right(tImageUrl));
      verify(mockProfileRepository.updateProfilePicture(tImagePath));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return failure when repository fails', () async {
      // arrange
      const tFailure = ServerFailure('Failed to upload image');
      when(mockProfileRepository.updateProfilePicture(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.updateProfilePicture(tImagePath));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return AuthFailure when user is not authenticated', () async {
      // arrange
      const tFailure = AuthFailure('User not authenticated');
      when(mockProfileRepository.updateProfilePicture(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.updateProfilePicture(tImagePath));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return ValidationFailure when invalid file is provided', () async {
      // arrange
      const tFailure = ValidationFailure('Invalid image file format');
      when(mockProfileRepository.updateProfilePicture(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.updateProfilePicture(tImagePath));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return NetworkFailure when network connection fails', () async {
      // arrange
      const tFailure = NetworkFailure('No internet connection');
      when(mockProfileRepository.updateProfilePicture(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.updateProfilePicture(tImagePath));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should handle different image file types', () async {
      // arrange
      final pngImagePath = '/path/to/image.png';
      final pngParams = UpdateProfilePictureParams(imagePath: pngImagePath);
      const pngImageUrl = 'https://example.com/uploaded_image.png';
      
      when(mockProfileRepository.updateProfilePicture(pngImagePath))
          .thenAnswer((_) async => const Right(pngImageUrl));

      // act
      final result = await usecase(pngParams);

      // assert
      expect(result, const Right(pngImageUrl));
      verify(mockProfileRepository.updateProfilePicture(pngImagePath));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return CacheFailure when local storage fails', () async {
      // arrange
      const tFailure = CacheFailure('Failed to save image locally');
      when(mockProfileRepository.updateProfilePicture(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.updateProfilePicture(tImagePath));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should handle large file size validation failure', () async {
      // arrange
      const tFailure = ValidationFailure('Image file size too large');
      when(mockProfileRepository.updateProfilePicture(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.updateProfilePicture(tImagePath));
      verifyNoMoreInteractions(mockProfileRepository);
    });
  });
}
