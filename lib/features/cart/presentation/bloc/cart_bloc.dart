import 'package:flutter_bloc/flutter_bloc.dart';
class CartBloc extends Bloc {
  final dynamic getCartItemsUseCase;
  final dynamic addToCartUseCase;
  final dynamic updateCartItemUseCase;
  final dynamic removeFromCartUseCase;
  final dynamic clearCartUseCase;
  CartBloc({
    required this.getCartItemsUseCase,
    required this.addToCartUseCase,
    required this.updateCartItemUseCase,
    required this.removeFromCartUseCase,
    required this.clearCartUseCase,
  }) : super(null);
}
