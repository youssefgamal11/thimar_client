import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/server_gate.dart';
import 'package:thimar_app/screens/home/pages/main/bloc/events.dart';
import 'package:thimar_app/screens/home/pages/main/bloc/states.dart';
import 'package:thimar_app/screens/home/pages/main/models/categories_model.dart';
import 'package:thimar_app/screens/home/pages/main/models/products_model.dart';
import 'package:thimar_app/screens/home/pages/main/models/slider_model.dart';

class MainBloc extends Bloc<MainEvents, MainStates> {
  ServerGate serverGate = ServerGate();
  MainBloc() : super(InitalState()) {
    on<MainGetSliderDataEvent>(_getSliderData);
    on<MainGetCategoriesDataEvent>(_getCategoriesData);
    on<MainGetProductsEvent>(_getProducts);
  }

  SliderModel? sliderModel;
  CategoriesModel? categoriesModel;
  ProductsModel? productsModel;
  void _getSliderData(
      MainGetSliderDataEvent event, Emitter<MainStates> emit) async {
    CustomResponse response = await serverGate.getFromServer(url: 'sliders');

    if (response.success) {
      sliderModel = SliderModel.fromJson(response.response!.data);
      emit(SliderDataSucessState());
    } else {
      emit(SliderDataFailState(error: response.errType.toString()));
    }
  }

  void _getCategoriesData(
      MainGetCategoriesDataEvent event, Emitter<MainStates> emit) async {
    CustomResponse response = await serverGate.getFromServer(url: 'categories');
    if (response.success) {
      categoriesModel = CategoriesModel.fromJson(response.response!.data);
      emit(CategoriesDataSucessState());
    } else {
      emit(CategoriesDataFailState(error: response.errType.toString()));
    }
  }

  void _getProducts(
      MainGetProductsEvent event, Emitter<MainStates> emit) async {
    CustomResponse response = await serverGate.getFromServer(url: 'products');
    if (response.success) {
      productsModel = ProductsModel.fromJson(response.response!.data);
      emit(ProductsDataSucessState());
    } else {
      emit(ProductsDataFailState(error: response.errType.toString()));
    }
  }
}
