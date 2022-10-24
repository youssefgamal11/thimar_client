import 'package:thimar_app/screens/category_products/models/category_products_model.dart';

class CategoryProductsStates {}

class CategoryProductsInitalState extends CategoryProductsStates {}

class CategoryProductsDataLoadingState extends CategoryProductsStates {}

class CategoryProductsDataSucessState extends CategoryProductsStates {
  CategoryProductsModel model;
  CategoryProductsDataSucessState({required this.model});
}

class CategoryProductsDataFailState extends CategoryProductsStates {
  final String error;
  CategoryProductsDataFailState({required this.error});
}
