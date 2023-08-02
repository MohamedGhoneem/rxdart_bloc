import 'package:rxdart_bloc/rxdart_bloc.dart';

import '../../../network/network.dart';
import '../../models/error_model.dart';
import '../model/products_response_model.dart';
import 'products_repo_interface.dart';
///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class ProductsRepo implements ProductsRepoInterface {
  final Network _network;
  ProductsRepo(this._network);

  @override
  Future<BaseModel> getProducts() async {
    try {
      var response =
          await _network.request(HttpMethod.get, endpoint: 'products');
      return GetAllProductsResponseModel.fromJson(response?.data);
    } catch (e) {
      return ErrorModel.fromJson(e as dynamic);
    }
  }
}
