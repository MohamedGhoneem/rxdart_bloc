import 'package:rxdart_bloc/rxdart_bloc.dart';
import '../../../network/network.dart';
import '../../models/error_model.dart';
import '../model/products_response_model.dart';
import '../repo/products_repo.dart';

class ProductsBloc extends BaseBloc
    with RxdartBlocState<GetAllProductsResponseModel, ErrorModel> {
  BehaviorSubject<RequestState> requestStateSubject = BehaviorSubject.seeded(
      RequestState(status: RequestStatus.loading, message: ''));
  final ProductsRepo _countriesRepo =
      ProductsRepo(Network('https://dummyjson.com/'));

  Future getProducts() async {
    var model = await _countriesRepo.getProducts();
    if (model is GetAllProductsResponseModel) {
      super.successSubject.sink.add(model);
      requestStateSubject.sink
          .add(RequestState(status: RequestStatus.success, message: 'SUCCESS'));
    }
    if (model is ErrorModel) {
      super.errorSubject.sink.add(model);
      requestStateSubject.sink.add(RequestState(
          status: RequestStatus.error, message: model.message ?? ''));
    }
  }

  @override
  void dispose() {
    requestStateSubject.close();
  }
}
