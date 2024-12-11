import 'package:ecommerce/domain/order/entities/product_ordered.dart';

abstract class CartProductsDisplayState {}

class CartProductLoading extends CartProductsDisplayState {}

class CartProductLoaded extends CartProductsDisplayState {
  final List<ProductOrderedEntity> products;

  CartProductLoaded({required this.products});
}

class LoadCartProductsFailure extends CartProductsDisplayState {
  final String errorMessage;

  LoadCartProductsFailure({required this.errorMessage});
}
