class ProductsDetailsStates {}

class ProductsDetailsInitialState extends ProductsDetailsStates {}

class ProductsDetailsSucessState extends ProductsDetailsStates {}

class ProductsDetailsFailState extends ProductsDetailsStates {
  final String error;
  ProductsDetailsFailState({required this.error});
}

class SimillarProductsDataSucessState extends ProductsDetailsStates {}

class SimillarProductsDataFailState extends ProductsDetailsStates {
  final String error;
  SimillarProductsDataFailState({required this.error});
}

class ChangeActiveIndex extends ProductsDetailsStates {}
