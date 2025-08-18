import 'package:cloud_firestore/cloud_firestore.dart';

/// Utility class to add sample products to Firestore
class FirestoreSampleData {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Add sample products to Firestore
  /// This is a one-time setup function to populate the database with sample data
  static Future<void> addSampleProducts() async {
    final products = [
      {
        'id': 1,
        'title': 'Wireless Bluetooth Headphones',
        'description':
            'Premium wireless headphones with noise cancellation and 20-hour battery life.',
        'price': 99.99,
        'brand': 'TechSound',
        'sku': 'TS-WH-001',
        'images': [
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
          'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400',
        ],
        'rating': 4.5,
      },
      {
        'id': 2,
        'title': 'Smartphone Stand',
        'description':
            'Adjustable smartphone stand for desk and bedside table. Compatible with all phone sizes.',
        'price': 24.99,
        'brand': 'PhoneGear',
        'sku': 'PG-ST-002',
        'images': [
          'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400',
        ],
        'rating': 4.2,
      },
      {
        'id': 3,
        'title': 'USB-C Charging Cable',
        'description':
            'Fast charging USB-C cable with durable braided design. 6 feet long.',
        'price': 15.99,
        'brand': 'PowerCord',
        'sku': 'PC-UC-003',
        'images': [
          'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400',
        ],
        'rating': 4.0,
      },
      {
        'id': 4,
        'title': 'Portable Speaker',
        'description':
            'Compact Bluetooth speaker with 360-degree sound and waterproof design.',
        'price': 79.99,
        'brand': 'SoundWave',
        'sku': 'SW-PS-004',
        'images': [
          'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400',
          'https://images.unsplash.com/photo-1545454675-3531b543be5d?w=400',
        ],
        'rating': 4.7,
      },
      {
        'id': 5,
        'title': 'Laptop Backpack',
        'description':
            'Professional laptop backpack with multiple compartments and USB charging port.',
        'price': 59.99,
        'brand': 'TravelPro',
        'sku': 'TP-LB-005',
        'images': [
          'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
        ],
        'rating': 4.3,
      },
      {
        'id': 6,
        'title': 'Gaming Mouse',
        'description':
            'High-precision gaming mouse with RGB lighting and programmable buttons.',
        'price': 49.99,
        'brand': 'GameTech',
        'sku': 'GT-GM-006',
        'images': [
          'https://images.unsplash.com/photo-1527814050087-3793815479db?w=400',
        ],
        'rating': 4.6,
      },
      {
        'id': 7,
        'title': 'Wireless Keyboard',
        'description':
            'Slim wireless keyboard with backlit keys and long battery life.',
        'price': 69.99,
        'brand': 'TypeMaster',
        'sku': 'TM-WK-007',
        'images': [
          'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=400',
        ],
        'rating': 4.4,
      },
      {
        'id': 8,
        'title': 'Smart Watch',
        'description':
            'Fitness tracking smartwatch with heart rate monitor and GPS.',
        'price': 199.99,
        'brand': 'FitTime',
        'sku': 'FT-SW-008',
        'images': [
          'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?w=400',
          'https://images.unsplash.com/photo-1579586337278-3f436f25d4d6?w=400',
        ],
        'rating': 4.1,
      },
    ];

    try {
      final batch = _firestore.batch();

      for (final product in products) {
        final docRef = _firestore
            .collection('products')
            .doc(product['id'].toString());
        batch.set(docRef, product);
      }

      await batch.commit();
      print('✅ Sample products added to Firestore successfully!');
    } catch (e) {
      print('❌ Error adding sample products: $e');
    }
  }

  /// Check if products collection is empty
  static Future<bool> isProductsCollectionEmpty() async {
    try {
      final snapshot = await _firestore.collection('products').limit(1).get();
      return snapshot.docs.isEmpty;
    } catch (e) {
      print('❌ Error checking products collection: $e');
      return true;
    }
  }
}
