import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/products/data/datasources/products_remote_data_source.dart';
import 'package:ecommerce/src/features/products/data/models/product_model.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'products_remote_data_source_test.mocks.dart';

@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  DocumentSnapshot,
  QuerySnapshot,
  QueryDocumentSnapshot,
])
void main() {
  late FirebaseFirestore firestore;
  late ProductsRemoteDataSource dataSource;

  setUp(() {
    firestore = MockFirebaseFirestore();
    dataSource = ProductsRemoteDataSourceImpl(firestore: firestore);
  });

  group('getProducts', () {
    test('should call GET /products and parse JSON', () async {
      final collection = MockCollectionReference<Map<String, dynamic>>();
      final querySnapshot = MockQuerySnapshot<Map<String, dynamic>>();
      final docs = (jsonDecode(fixture('products.json')) as List)
          .map((e) => _fakeQueryDoc(e as Map<String, dynamic>))
          .toList();

      when(firestore.collection('products')).thenReturn(collection);
      when(collection.get()).thenAnswer((_) async => querySnapshot);
      when(querySnapshot.docs).thenReturn(docs);

      final result = await dataSource.getProducts();

      expect(result, isA<List<ProductModel>>());
      verify(firestore.collection('products'));
    });

    test('should throw ServerException on non-200', () async {
      final collection = MockCollectionReference<Map<String, dynamic>>();
      when(firestore.collection('products')).thenReturn(collection);
      when(collection.get()).thenThrow(Exception('boom'));

      expect(() => dataSource.getProducts(), throwsA(isA<ServerException>()));
      verify(firestore.collection('products'));
    });
  });

  group('getProduct', () {
    test('should call GET /products/{id} and parse JSON', () async {
      final collection = MockCollectionReference<Map<String, dynamic>>();
      final docRef = MockDocumentReference<Map<String, dynamic>>();
      final docSnapshot = MockDocumentSnapshot<Map<String, dynamic>>();
      final data = jsonDecode(fixture('product.json')) as Map<String, dynamic>;

      when(firestore.collection('products')).thenReturn(collection);
      when(collection.doc('1')).thenReturn(docRef);
      when(docRef.get()).thenAnswer((_) async => docSnapshot);
      when(docSnapshot.exists).thenReturn(true);
      when(docSnapshot.data()).thenReturn(data);

      final result = await dataSource.getProduct(1);

      expect(result, isA<ProductModel>());
      verify(firestore.collection('products'));
    });

    test('should throw ServerException on non-200', () async {
      final collection = MockCollectionReference<Map<String, dynamic>>();
      final docRef = MockDocumentReference<Map<String, dynamic>>();
      final docSnapshot = MockDocumentSnapshot<Map<String, dynamic>>();

      when(firestore.collection('products')).thenReturn(collection);
      when(collection.doc('1')).thenReturn(docRef);
      when(docRef.get()).thenAnswer((_) async => docSnapshot);
      when(docSnapshot.exists).thenReturn(false);

      expect(() => dataSource.getProduct(1), throwsA(isA<ServerException>()));
      verify(firestore.collection('products'));
    });
  });
}

QueryDocumentSnapshot<Map<String, dynamic>> _fakeQueryDoc(
  Map<String, dynamic> data,
) {
  final doc = MockQueryDocumentSnapshot<Map<String, dynamic>>();
  when(doc.data()).thenReturn(data);
  return doc;
}
