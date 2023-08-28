import 'package:flutter/material.dart';
import 'package:rxdart_bloc/rxdart_bloc.dart';
import '../bloc/products_bloc.dart';
import '../model/products_response_model.dart';
import 'widget/products_item_widget.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  late ProductsBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<ProductsBloc>(context);
    _bloc.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement getBody
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: StreamBuilder<GetAllProductsResponseModel>(
          stream: _bloc.successStream,
          builder: (context, snapshot) {
            return StreamingResult(
              subject: _bloc.requestStateSubject,
              // initWidget: const Center(child: Text('Initial')),
              successWidget: ListView.builder(
                  itemCount: snapshot.data?.products?.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return ProductsItemWidget(
                      content: snapshot.data?.products?[index],
                    );
                  }),
              emptyWidget: const Center(child: Text('Empty')),
              errorWidget: const Center(child: Text('Error')),
              retry: () => _bloc.getProducts(),
            );
          }),
    );
  }
}
