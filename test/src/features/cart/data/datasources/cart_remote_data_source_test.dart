import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:ecommerce/src/features/cart/data/models/cart_item_model.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'cart_remote_data_source_test.mocks.dart';

@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  DocumentSnapshot,
  QuerySnapshot,
  QueryDocumentSnapshot,
  WriteBatch,
])
void main() {
  late FirebaseFirestore firestore;
  late CartRemoteDataSource dataSource;

  setUp(() {
    firestore = MockFirebaseFirestore();
    dataSource = CartRemoteDataSourceImpl(firestore: firestore);
  });

  final cartItemJson = jsonDecode(fixture('cart_item.json')) as Map<String, dynamic>;
  final testCartItemModel = CartItemModel.fromJson(cartItemJson);

  group('addToCart', () {
    test('should add cart item to Firebase and return updated model', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      final userDoc = MockDocumentReference<Map<String, dynamic>>();
      final itemsCollection = MockCollectionReference<Map<String, dynamic>>();
      final itemDoc = MockDocumentReference<Map<String, dynamic>>();

      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc('user123')).thenReturn(userDoc);
      when(userDoc.collection('items')).thenReturn(itemsCollection);
      when(itemsCollection.doc('1')).thenReturn(itemDoc);
      when(itemDoc.set(any)).thenAnswer((_) async {});

      final result = await dataSource.addToCart(testCartItemModel);

      expect(result, isA<CartItemModel>());
      expect(result.id, testCartItemModel.product.id);
      verify(firestore.collection('carts'));
      verify(cartCollection.doc('user123'));
      verify(userDoc.collection('items'));
      verify(itemsCollection.doc('1'));
      verify(itemDoc.set(any));
    });

    test('should throw ServerException when Firebase operation fails', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc(any)).thenThrow(Exception('Firebase error'));

      expect(
        () => dataSource.addToCart(testCartItemModel),
        throwsA(isA<ServerException>()),
      );
    });
  });

  group('getCartItems', () {
    test('should get cart items from Firebase and return list of CartItemModel', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      final userDoc = MockDocumentReference<Map<String, dynamic>>();
      final itemsCollection = MockCollectionReference<Map<String, dynamic>>();
      final querySnapshot = MockQuerySnapshot<Map<String, dynamic>>();
      final queryDoc = MockQueryDocumentSnapshot<Map<String, dynamic>>();

      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc('user123')).thenReturn(userDoc);
      when(userDoc.collection('items')).thenReturn(itemsCollection);
      when(itemsCollection.orderBy('createdAt', descending: true)).thenReturn(itemsCollection);
      when(itemsCollection.get()).thenAnswer((_) async => querySnapshot);
      when(querySnapshot.docs).thenReturn([queryDoc]);
      when(queryDoc.data()).thenReturn(cartItemJson);
      when(queryDoc.id).thenReturn('1');

      final result = await dataSource.getCartItems('user123');

      expect(result, isA<List<CartItemModel>>());
      expect(result.length, 1);
      verify(firestore.collection('carts'));
      verify(cartCollection.doc('user123'));
      verify(userDoc.collection('items'));
    });

    test('should throw ServerException when Firebase operation fails', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc(any)).thenThrow(Exception('Firebase error'));

      expect(
        () => dataSource.getCartItems('user123'),
        throwsA(isA<ServerException>()),
      );
    });
  });

  group('getCartItem', () {
    test('should return cart item when it exists', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      final userDoc = MockDocumentReference<Map<String, dynamic>>();
      final itemsCollection = MockCollectionReference<Map<String, dynamic>>();
      final itemDoc = MockDocumentReference<Map<String, dynamic>>();
      final docSnapshot = MockDocumentSnapshot<Map<String, dynamic>>();

      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc('user123')).thenReturn(userDoc);
      when(userDoc.collection('items')).thenReturn(itemsCollection);
      when(itemsCollection.doc('1')).thenReturn(itemDoc);
      when(itemDoc.get()).thenAnswer((_) async => docSnapshot);
      when(docSnapshot.exists).thenReturn(true);
      when(docSnapshot.data()).thenReturn(cartItemJson);
      when(docSnapshot.id).thenReturn('1');

      final result = await dataSource.getCartItem('user123', 1);

      expect(result, isA<CartItemModel>());
      expect(result, isNotNull);
      verify(firestore.collection('carts'));
      verify(cartCollection.doc('user123'));
      verify(userDoc.collection('items'));
      verify(itemsCollection.doc('1'));
    });

    test('should return null when cart item does not exist', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      final userDoc = MockDocumentReference<Map<String, dynamic>>();
      final itemsCollection = MockCollectionReference<Map<String, dynamic>>();
      final itemDoc = MockDocumentReference<Map<String, dynamic>>();
      final docSnapshot = MockDocumentSnapshot<Map<String, dynamic>>();

      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc('user123')).thenReturn(userDoc);
      when(userDoc.collection('items')).thenReturn(itemsCollection);
      when(itemsCollection.doc('1')).thenReturn(itemDoc);
      when(itemDoc.get()).thenAnswer((_) async => docSnapshot);
      when(docSnapshot.exists).thenReturn(false);

      final result = await dataSource.getCartItem('user123', 1);

      expect(result, isNull);
    });

    test('should throw ServerException when Firebase operation fails', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc(any)).thenThrow(Exception('Firebase error'));

      expect(
        () => dataSource.getCartItem('user123', 1),
        throwsA(isA<ServerException>()),
      );
    });
  });

  group('updateCartItem', () {
    test('should update cart item in Firebase and return updated model', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      final userDoc = MockDocumentReference<Map<String, dynamic>>();
      final itemsCollection = MockCollectionReference<Map<String, dynamic>>();
      final itemDoc = MockDocumentReference<Map<String, dynamic>>();

      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc('user123')).thenReturn(userDoc);
      when(userDoc.collection('items')).thenReturn(itemsCollection);
      when(itemsCollection.doc('1')).thenReturn(itemDoc);
      when(itemDoc.update(any)).thenAnswer((_) async {});

      final result = await dataSource.updateCartItem(testCartItemModel);

      expect(result, isA<CartItemModel>());
      expect(result.updatedAt.isAfter(testCartItemModel.updatedAt), true);
      verify(firestore.collection('carts'));
      verify(cartCollection.doc('user123'));
      verify(userDoc.collection('items'));
      verify(itemsCollection.doc('1'));
      verify(itemDoc.update(any));
    });

    test('should throw ServerException when Firebase operation fails', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc(any)).thenThrow(Exception('Firebase error'));

      expect(
        () => dataSource.updateCartItem(testCartItemModel),
        throwsA(isA<ServerException>()),
      );
    });
  });

  group('removeFromCart', () {
    test('should remove cart item from Firebase', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      final userDoc = MockDocumentReference<Map<String, dynamic>>();
      final itemsCollection = MockCollectionReference<Map<String, dynamic>>();
      final itemDoc = MockDocumentReference<Map<String, dynamic>>();

      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc('user123')).thenReturn(userDoc);
      when(userDoc.collection('items')).thenReturn(itemsCollection);
      when(itemsCollection.doc('1')).thenReturn(itemDoc);
      when(itemDoc.delete()).thenAnswer((_) async {});

      await dataSource.removeFromCart('user123', 1);

      verify(firestore.collection('carts'));
      verify(cartCollection.doc('user123'));
      verify(userDoc.collection('items'));
      verify(itemsCollection.doc('1'));
      verify(itemDoc.delete());
    });

    test('should throw ServerException when Firebase operation fails', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc(any)).thenThrow(Exception('Firebase error'));

      expect(
        () => dataSource.removeFromCart('user123', 1),
        throwsA(isA<ServerException>()),
      );
    });
  });

  group('clearCart', () {
    test('should clear all cart items from Firebase', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      final userDoc = MockDocumentReference<Map<String, dynamic>>();
      final itemsCollection = MockCollectionReference<Map<String, dynamic>>();
      final querySnapshot = MockQuerySnapshot<Map<String, dynamic>>();
      final queryDoc = MockQueryDocumentSnapshot<Map<String, dynamic>>();
      final docRef = MockDocumentReference<Map<String, dynamic>>();
      final batch = MockWriteBatch();

      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc('user123')).thenReturn(userDoc);
      when(userDoc.collection('items')).thenReturn(itemsCollection);
      when(itemsCollection.get()).thenAnswer((_) async => querySnapshot);
      when(querySnapshot.docs).thenReturn([queryDoc]);
      when(queryDoc.reference).thenReturn(docRef);
      when(firestore.batch()).thenReturn(batch);
      when(batch.delete(any)).thenReturn(null);
      when(batch.commit()).thenAnswer((_) async {});

      await dataSource.clearCart('user123');

      verify(firestore.collection('carts'));
      verify(cartCollection.doc('user123'));
      verify(userDoc.collection('items'));
      verify(itemsCollection.get());
      verify(firestore.batch());
      verify(batch.delete(docRef));
      verify(batch.commit());
    });

    test('should throw ServerException when Firebase operation fails', () async {
      final cartCollection = MockCollectionReference<Map<String, dynamic>>();
      when(firestore.collection('carts')).thenReturn(cartCollection);
      when(cartCollection.doc(any)).thenThrow(Exception('Firebase error'));

      expect(
        () => dataSource.clearCart('user123'),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
