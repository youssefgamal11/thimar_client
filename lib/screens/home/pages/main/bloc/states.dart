class MainStates {}

class InitalState extends MainStates {}

class SliderDataSucessState extends MainStates {}

class SliderDataFailState extends MainStates {
  final String error;
  SliderDataFailState({required this.error});
}

class CategoriesDataSucessState extends MainStates {}

class CategoriesDataFailState extends MainStates {
  final String error;
  CategoriesDataFailState({required this.error});
}

class ProductsDataSucessState extends MainStates {}

class ProductsDataFailState extends MainStates {
  final String error;
  ProductsDataFailState({required this.error});
}
