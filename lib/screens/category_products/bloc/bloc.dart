import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/server_gate.dart';
import 'package:thimar_app/screens/category_products/bloc/events.dart';
import 'package:thimar_app/screens/category_products/bloc/states.dart';
import 'package:thimar_app/screens/category_products/models/category_products_model.dart';

class CategoryProductsBloc
    extends Bloc<CategoryProductsEvents, CategoryProductsStates> {
  ServerGate serverGate = ServerGate();
  int? categoryId;
  CategoryProductsBloc() : super(CategoryProductsInitalState()) {
    on<GetCategoryProductsDataEvent>(_getCategoryProducts);
  }

  void _getCategoryProducts(
    GetCategoryProductsDataEvent event,
    Emitter<CategoryProductsStates> emit,
  ) async {
    emit(CategoryProductsDataLoadingState());
    CustomResponse response =
        await serverGate.getFromServer(url: 'categories/$categoryId');
    if (response.success) {
      emit(CategoryProductsDataSucessState(
        model: CategoryProductsModel.fromJson(response.response!.data),
      ));
    } else {
      emit(CategoryProductsDataFailState(error: response.errType.toString()));
    }
  }
}
