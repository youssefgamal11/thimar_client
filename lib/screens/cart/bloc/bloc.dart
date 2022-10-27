import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/server_gate.dart';
import 'package:thimar_app/screens/cart/bloc/events.dart';
import 'package:thimar_app/screens/cart/bloc/states.dart';
import 'package:thimar_app/screens/cart/models/cart_model.dart';

class CartBloc extends Bloc<CartEvents, CartStates> {
  ServerGate serverGate = ServerGate();
  CartBloc() : super(CartInitialState()) {
    on<GetCartDataEvent>(_getCartData);
  }
  void _getCartData(CartEvents event, Emitter<CartStates> emit) async {
    emit(CartDataLoadingState());
    CustomResponse response =
        await serverGate.getFromServer(url: 'client/cart');
    if (response.success) {
      final model = CartModel.fromJson(response.response!.data);
      emit(CartDataSucessState(
        model: model,
      ));
    } else {
      emit(CartDataFailedState(error: response.errType.toString()));
    }
  }

  // void _deleteProduct(CartEvents events, Emitter<CartStates> emit) {
  //   emit(DeleteProductLoadingState());
  //   CustomResponse response = serverGate.
  // }
}
