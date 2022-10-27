import 'package:thimar_app/screens/cart/models/cart_model.dart';
import 'package:thimar_app/screens/cart/models/delete_product_model.dart';

class CartStates {}

class CartInitialState extends CartStates {}

class CartDataLoadingState extends CartStates {}

class CartDataSucessState extends CartStates {
  CartModel model;
  CartDataSucessState({required this.model});
}

class CartDataFailedState extends CartStates {
  final String error;
  CartDataFailedState({required this.error});
}

class DeleteProductLoadingState extends CartStates {}

class DeleteProductSucessState extends CartStates {
  DeleteProductModel model;
  DeleteProductSucessState({required this.model});
}

class DeleteProductFailedState extends CartStates {
  final String error;
  DeleteProductFailedState({required this.error});
}
