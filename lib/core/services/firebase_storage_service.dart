import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:dartz/dartz.dart';
import '../error/failures.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage;

  FirebaseStorageService({FirebaseStorage? storage})
      : _storage = storage ?? FirebaseStorage.instance;

  Future<Either<Failure, String>> uploadFile({
    required String path,
    required File file,
    Map<String, String>? metadata,
    void Function(double)? onProgress,
  }) async {
    try {
      final ref = _storage.ref(path);
      
      final uploadTask = ref.putFile(
        file,
        metadata != null ? SettableMetadata(customMetadata: metadata) : null,
      );

      if (onProgress != null) {
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          final progress = snapshot.bytesTransferred / snapshot.totalBytes;
          onProgress(progress);
        });
      }

      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return Right(downloadUrl);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to upload file',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> uploadBytes({
    required String path,
    required Uint8List bytes,
    Map<String, String>? metadata,
    void Function(double)? onProgress,
  }) async {
    try {
      final ref = _storage.ref(path);
      
      final uploadTask = ref.putData(
        bytes,
        metadata != null ? SettableMetadata(customMetadata: metadata) : null,
      );

      if (onProgress != null) {
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          final progress = snapshot.bytesTransferred / snapshot.totalBytes;
          onProgress(progress);
        });
      }

      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return Right(downloadUrl);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to upload bytes',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> uploadString({
    required String path,
    required String data,
    PutStringFormat format = PutStringFormat.raw,
    Map<String, String>? metadata,
  }) async {
    try {
      final ref = _storage.ref(path);
      
      final snapshot = await ref.putString(
        data,
        format: format,
        metadata:
            metadata != null ? SettableMetadata(customMetadata: metadata) : null,
      );
      
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return Right(downloadUrl);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to upload string',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteFile(String path) async {
    try {
      final ref = _storage.ref(path);
      await ref.delete();
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to delete file',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> getDownloadUrl(String path) async {
    try {
      final ref = _storage.ref(path);
      final url = await ref.getDownloadURL();
      return Right(url);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to get download URL',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, FullMetadata>> getMetadata(String path) async {
    try {
      final ref = _storage.ref(path);
      final metadata = await ref.getMetadata();
      return Right(metadata);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to get metadata',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, FullMetadata>> updateMetadata(
    String path,
    Map<String, String> metadata,
  ) async {
    try {
      final ref = _storage.ref(path);
      final updated = await ref.updateMetadata(
        SettableMetadata(customMetadata: metadata),
      );
      return Right(updated);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to update metadata',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, ListResult>> listFiles(
    String path, {
    int? maxResults,
    String? pageToken,
  }) async {
    try {
      final ref = _storage.ref(path);
      final result = await ref.list(
        ListOptions(
          maxResults: maxResults,
          pageToken: pageToken,
        ),
      );
      return Right(result);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to list files',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, List<Reference>>> listAllFiles(String path) async {
    try {
      final ref = _storage.ref(path);
      final result = await ref.listAll();
      return Right(result.items);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to list all files',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, Uint8List>> downloadFile(
    String path, {
    int? maxSize,
  }) async {
    try {
      final ref = _storage.ref(path);
      final bytes = await ref.getData(maxSize ?? 10485760); // 10MB default
      if (bytes == null) {
        return const Left(NotFoundFailure(message: 'File not found'));
      }
      return Right(bytes);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to download file',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> downloadToFile(
    String path,
    File file,
    void Function(double)? onProgress,
  ) async {
    try {
      final ref = _storage.ref(path);
      final downloadTask = ref.writeToFile(file);

      if (onProgress != null) {
        downloadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          final progress = snapshot.bytesTransferred / snapshot.totalBytes;
          onProgress(progress);
        });
      }

      await downloadTask;
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to download to file',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  String generateStoragePath({
    required String folder,
    required String fileName,
    String? userId,
  }) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final uniqueFileName = '${timestamp}_$fileName';
    
    if (userId != null) {
      return '$folder/$userId/$uniqueFileName';
    }
    return '$folder/$uniqueFileName';
  }
}