import 'package:rxdart_bloc/base_model.dart';
import '../../../network/network.dart';
import '../../models/error_model.dart';
import '../model/products_response_model.dart';
import 'products_repo_interface.dart';

class ProductsRepo implements ProductsRepoInterface {
  final Network _network;
  ProductsRepo(this._network);

  @override
  Future<BaseModel> getProducts() async {
    try {
      var response =
          await _network.request(HttpMethod.get, 'productss');
      return GetAllProductsResponseModel.fromJson(response?.data);
    } catch (e) {
      return ErrorModel.fromJson(e as dynamic);
    }
  }
}
