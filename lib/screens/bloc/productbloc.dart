

import 'package:rxdart/rxdart.dart';

import '../apis/repository.dart';
import '../model/product.dart';

class ProductBloc {
  final _repository = Repository();
  final _productfetcher = PublishSubject<ProductModel>();
  Stream<ProductModel> get allproduct => _productfetcher.stream;

  fetchallproduct() async {
    ProductModel productModel = await _repository.getallproducts();
    _productfetcher.sink.add(productModel);

  }

  dispose(){
    _productfetcher.close();
  }
}


final bloc = ProductBloc();