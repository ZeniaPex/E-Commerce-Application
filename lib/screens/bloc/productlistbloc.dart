import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

import '../apis/repository.dart';
import '../model/product.dart';
import '../model/productlist.dart';

class ProductListBloc {
  final _repository = Repository();
  final _productlistfetcher = PublishSubject<ProductListModel>();

  Stream<ProductListModel> get allproductlist => _productlistfetcher.stream;

  fetchallproductlist() async {
    ProductListModel productListModel = await _repository.getallproductlist();
    _productlistfetcher.sink.add(productListModel);
  }

  dispose() {
    _productlistfetcher.close();
  }
}

final bloc = ProductListBloc();
