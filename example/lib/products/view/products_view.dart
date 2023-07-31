
import 'package:flutter/material.dart';
import 'package:rxdart_bloc/rxdart_bloc.dart';

import '../bloc/products_bloc.dart';
import '../model/products_response_model.dart';
import 'widget/products_item_widget.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
ProductsBloc bloc = ProductsBloc();
  @override
  void initState() {
    bloc= BlocProvider.of<ProductsBloc>(context);
    bloc.getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement getBody
    return Scaffold(
      appBar: AppBar(title: const Text('Products'),),
      body: StreamBuilder<GetAllProductsResponseModel>(
        stream: bloc.successStream,
        builder: (context, snapshot) {
          return StreamingResult(
            subject: bloc.requestStateSubject,
            successWidget: ListView.builder(
                      itemCount: snapshot.data?.products?.length,
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        return ProductsItemWidget(
                          content: snapshot.data?.products?[index],
                        );
                      }),
            retry: () =>
                bloc.getProducts(),
          );
        }
      ),
    );

  }

}
