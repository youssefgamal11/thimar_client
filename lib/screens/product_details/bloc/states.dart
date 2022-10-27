import 'package:flutter/services.dart';

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

class ChangeActiveIndexState extends ProductsDetailsStates {}

class IncreaseAmountState extends ProductsDetailsStates {}

class DecreaseAmountState extends ProductsDetailsStates {}

class PutIntoCartLoadingState extends ProductsDetailsStates {}

class PutIntoCartSucessState extends ProductsDetailsStates {}

class PutIntoCartFailtate extends ProductsDetailsStates {
  final String error;
  PutIntoCartFailtate({required this.error});
}
