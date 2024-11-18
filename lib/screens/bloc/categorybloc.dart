import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import '../apis/repository.dart';
import '../model/category_section.dart';

class CategoryBloc {
  final _repository = Repository();
  final _categoryfetcher = PublishSubject<CategorySection>();

  var allproduct;

  var allsubcategory;

  Stream<CategorySection> get allcategory => _categoryfetcher.stream;

  fetchallcategory() async {
    CategorySection categorySection = await _repository.getallcategory();
    _categoryfetcher.sink.add(categorySection);
  }

  dispose() {
    _categoryfetcher.close();
  }

  void fetchallproduct()async {
    CategorySection categorySection =await _repository.getallproducts() as CategorySection;
    _categoryfetcher.sink.add(categorySection);
  }

  void fetchAllSubcategories() async{
    CategorySection categorySection = await _repository.getallsubcat() as CategorySection;
    _categoryfetcher.sink.add(categorySection);
  }

}

final bloc = CategoryBloc();

