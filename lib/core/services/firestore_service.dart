import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../error/failures.dart';

class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> collection(String path) {
    return _firestore.collection(path);
  }

  Future<Either<Failure, DocumentSnapshot<Map<String, dynamic>>>> getDocument(
    String collection,
    String documentId,
  ) async {
    try {
      final doc = await _firestore.collection(collection).doc(documentId).get();
      return Right(doc);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to get document',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>> getCollection(
    String collection, {
    int? limit,
    DocumentSnapshot? startAfter,
    List<QueryFilter>? filters,
    String? orderBy,
    bool descending = false,
  }) async {
    try {
      Query<Map<String, dynamic>> query = _firestore.collection(collection);

      if (filters != null) {
        for (final filter in filters) {
          query = query.where(
            filter.field,
            isEqualTo: filter.isEqualTo,
            isNotEqualTo: filter.isNotEqualTo,
            isLessThan: filter.isLessThan,
            isLessThanOrEqualTo: filter.isLessThanOrEqualTo,
            isGreaterThan: filter.isGreaterThan,
            isGreaterThanOrEqualTo: filter.isGreaterThanOrEqualTo,
            arrayContains: filter.arrayContains,
            arrayContainsAny: filter.arrayContainsAny,
            whereIn: filter.whereIn,
            whereNotIn: filter.whereNotIn,
            isNull: filter.isNull,
          );
        }
      }

      if (orderBy != null) {
        query = query.orderBy(orderBy, descending: descending);
      }

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      if (limit != null) {
        query = query.limit(limit);
      }

      final snapshot = await query.get();
      return Right(snapshot);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to get collection',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Stream<Either<Failure, QuerySnapshot<Map<String, dynamic>>>> 
      streamCollection(
    String collection, {
    int? limit,
    List<QueryFilter>? filters,
    String? orderBy,
    bool descending = false,
  }) {
    try {
      Query<Map<String, dynamic>> query = _firestore.collection(collection);

      if (filters != null) {
        for (final filter in filters) {
          query = query.where(
            filter.field,
            isEqualTo: filter.isEqualTo,
            isNotEqualTo: filter.isNotEqualTo,
            isLessThan: filter.isLessThan,
            isLessThanOrEqualTo: filter.isLessThanOrEqualTo,
            isGreaterThan: filter.isGreaterThan,
            isGreaterThanOrEqualTo: filter.isGreaterThanOrEqualTo,
            arrayContains: filter.arrayContains,
            arrayContainsAny: filter.arrayContainsAny,
            whereIn: filter.whereIn,
            whereNotIn: filter.whereNotIn,
            isNull: filter.isNull,
          );
        }
      }

      if (orderBy != null) {
        query = query.orderBy(orderBy, descending: descending);
      }

      if (limit != null) {
        query = query.limit(limit);
      }

      return query.snapshots().map((snapshot) => Right(snapshot));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  Stream<Either<Failure, DocumentSnapshot<Map<String, dynamic>>>> 
      streamDocument(
    String collection,
    String documentId,
  ) {
    try {
      return _firestore
          .collection(collection)
          .doc(documentId)
          .snapshots()
          .map((snapshot) => Right(snapshot));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  Future<Either<Failure, void>> setDocument(
    String collection,
    String documentId,
    Map<String, dynamic> data, {
    bool merge = false,
  }) async {
    try {
      await _firestore
          .collection(collection)
          .doc(documentId)
          .set(data, SetOptions(merge: merge));
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to set document',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, DocumentReference>> addDocument(
    String collection,
    Map<String, dynamic> data,
  ) async {
    try {
      final docRef = await _firestore.collection(collection).add(data);
      return Right(docRef);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to add document',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> updateDocument(
    String collection,
    String documentId,
    Map<String, dynamic> data,
  ) async {
    try {
      await _firestore.collection(collection).doc(documentId).update(data);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to update document',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteDocument(
    String collection,
    String documentId,
  ) async {
    try {
      await _firestore.collection(collection).doc(documentId).delete();
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to delete document',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> batchWrite(
    List<BatchOperation> operations,
  ) async {
    try {
      final batch = _firestore.batch();

      for (final operation in operations) {
        final docRef = _firestore
            .collection(operation.collection)
            .doc(operation.documentId);

        switch (operation.type) {
          case BatchOperationType.set:
            batch.set(docRef, operation.data!,
                SetOptions(merge: operation.merge));
            break;
          case BatchOperationType.update:
            batch.update(docRef, operation.data!);
            break;
          case BatchOperationType.delete:
            batch.delete(docRef);
            break;
        }
      }

      await batch.commit();
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to execute batch write',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, T>> runTransaction<T>(
    Future<T> Function(Transaction transaction) transactionHandler,
  ) async {
    try {
      final result =
          await _firestore.runTransaction<T>(transactionHandler);
      return Right(result);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(
        message: e.message ?? 'Failed to run transaction',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}

class QueryFilter {
  final String field;
  final Object? isEqualTo;
  final Object? isNotEqualTo;
  final Object? isLessThan;
  final Object? isLessThanOrEqualTo;
  final Object? isGreaterThan;
  final Object? isGreaterThanOrEqualTo;
  final Object? arrayContains;
  final List<Object?>? arrayContainsAny;
  final List<Object?>? whereIn;
  final List<Object?>? whereNotIn;
  final bool? isNull;

  QueryFilter({
    required this.field,
    this.isEqualTo,
    this.isNotEqualTo,
    this.isLessThan,
    this.isLessThanOrEqualTo,
    this.isGreaterThan,
    this.isGreaterThanOrEqualTo,
    this.arrayContains,
    this.arrayContainsAny,
    this.whereIn,
    this.whereNotIn,
    this.isNull,
  });
}

enum BatchOperationType { set, update, delete }

class BatchOperation {
  final String collection;
  final String documentId;
  final BatchOperationType type;
  final Map<String, dynamic>? data;
  final bool merge;

  BatchOperation({
    required this.collection,
    required this.documentId,
    required this.type,
    this.data,
    this.merge = false,
  });
}