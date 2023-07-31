
// Can be constructed and implemented, but not extended nor mixed in.
//  interface class CountriesRepoInterface{
//Implementation needed
//Future<BaseModel> getCountries() {
//   throw UnimplementedError();
// }
//}
//============================================================
//============================================================
// Can not be constructed.
// Can be implemented, but not extended nor mixed in.
//  abstract interface class CountriesRepoInterface{
// Implementation should be left out
// Future<BaseModel> getCountries();
// }

import 'package:rxdart_bloc/base_model.dart';

abstract interface class ProductsRepoInterface {
  Future<BaseModel> getProducts();
}
