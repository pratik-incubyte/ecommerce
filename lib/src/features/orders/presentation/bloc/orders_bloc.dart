import 'package:flutter_bloc/flutter_bloc.dart';
class OrdersBloc extends Bloc {
  final dynamic createOrderUseCase;
  final dynamic getOrdersUseCase;
  final dynamic getOrderDetailsUseCase;
  final dynamic cancelOrderUseCase;
  OrdersBloc({
    required this.createOrderUseCase,
    required this.getOrdersUseCase,
    required this.getOrderDetailsUseCase,
    required this.cancelOrderUseCase,
  }) : super(null);
}
