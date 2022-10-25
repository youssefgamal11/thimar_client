import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/server_gate.dart';
import 'package:thimar_app/screens/product_details/bloc/events.dart';
import 'package:thimar_app/screens/product_details/bloc/states.dart';
import 'package:thimar_app/screens/product_details/models/product_details_model.dart';
import 'package:thimar_app/screens/product_details/models/silmillar_products_model.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvents, ProductsDetailsStates> {
  ServerGate serverGate = ServerGate();
  int activeIndex = 0;
  ProductDetailsModel? productDetailsModel;
  SimillarProductsModel? simillarProductsModel;
  int? productId;

  ProductDetailsBloc() : super(ProductsDetailsInitialState()) {
    on<GetProductDetailsDataEvent>(_showProduct);
    on<GetSimillarProductsEvent>(_getSimillarProducts);
  }

  void changeActiveIndex(int index) {
    activeIndex = index;
    emit(ChangeActiveIndex());
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
}
