import 'package:ecommerce/domain/order/entities/product_ordered.dart';
import 'package:ecommerce/domain/order/use_cases/get_cart_products.dart';
import 'package:ecommerce/domain/order/use_cases/remove_cart_product.dart';
import 'package:ecommerce/presentaion/cart/bloc/cart_products_display_state.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsDisplayCubit extends Cubit<CartProductsDisplayState> {
  CartProductsDisplayCubit() : super(CartProductLoading());

  void displayCartProducts() async {
    var returnedData = await sl<GetCartProductsUseCase>().call();

    returnedData.fold((error) {
      emit(LoadCartProductsFailure(errorMessage: error));
    }, (data) {
      emit(CartProductLoaded(products: data));
    });
  }

  Future<void> removeProduct(ProductOrderedEntity product) async {
    emit(CartProductLoading());

    var returnedData =
        await sl<RemoveCartProductUseCase>().call(params: product.id);
    returnedData.fold((error) {
      emit(LoadCartProductsFailure(errorMessage: error));
    }, (data) {
      displayCartProducts();
    });
  }
}
