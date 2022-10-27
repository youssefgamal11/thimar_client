import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/server_gate.dart';
import 'package:thimar_app/screens/product_details/bloc/events.dart';
import 'package:thimar_app/screens/product_details/bloc/states.dart';
import 'package:thimar_app/screens/product_details/models/cart_model.dart';
import 'package:thimar_app/screens/product_details/models/product_details_model.dart';
import 'package:thimar_app/screens/product_details/models/silmillar_products_model.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvents, ProductsDetailsStates> {
  ServerGate serverGate = ServerGate();
  int activeIndex = 0;
  ProductDetailsModel? productDetailsModel;
  SimillarProductsModel? simillarProductsModel;
  PutIntoCartModel? putIntoCartModel;
  int? productId;
  int productAmount = 1;
  num? totalPrice;

  ProductDetailsBloc() : super(ProductsDetailsInitialState()) {
    on<GetProductDetailsDataEvent>(_showProduct);
    on<GetSimillarProductsEvent>(_getSimillarProducts);
    on<PutIntoCartEvent>(_putIntoCart);
  }

  void changeActiveIndex(int index) {
    activeIndex = index;
    emit(ChangeActiveIndexState());
  }

  void increaseAmount() {
    productAmount++;
    totalPrice = productAmount * productDetailsModel!.data!.price;

    emit(IncreaseAmountState());
  }

  void decreaseAmount() {
    if (productAmount > 1) {
      productAmount--;
      totalPrice = productAmount * productDetailsModel!.data!.price;
    } else {
      productAmount;
      totalPrice = productAmount * productDetailsModel!.data!.price;
    }
    emit(DecreaseAmountState());
  }

  void _showProduct(
      ProductDetailsEvents event, Emitter<ProductsDetailsStates> emit) async {
    CustomResponse response =
        await serverGate.getFromServer(url: 'products/$productId');
    if (response.success) {
      productDetailsModel =
          ProductDetailsModel.fromJson(response.response!.data);
      emit(ProductsDetailsSucessState());
    } else {
      emit(ProductsDetailsFailState(error: response.errType.toString()));
    }
  }

  void _getSimillarProducts(GetSimillarProductsEvent event,
      Emitter<ProductsDetailsStates> emit) async {
    CustomResponse response = await serverGate.getFromServer(url: 'products');
    if (response.success) {
      simillarProductsModel =
          SimillarProductsModel.fromJson(response.response!.data);
      emit(SimillarProductsDataSucessState());
    } else {
      emit(SimillarProductsDataFailState(error: response.errType.toString()));
    }
  }

  void _putIntoCart(
      PutIntoCartEvent event, Emitter<ProductsDetailsStates> emit) async {
    emit(PutIntoCartLoadingState());
    CustomResponse response =
        await serverGate.sendToServer(url: 'client/cart', body: {
      'product_id': productId,
      'amount': productAmount,
    });
    if (response.success) {
      putIntoCartModel = PutIntoCartModel.fromJson(response.response!.data);
      emit(PutIntoCartSucessState());
    } else {
      emit(PutIntoCartFailtate(
        error: response.errType.toString(),
      ));
    }
  }
}
