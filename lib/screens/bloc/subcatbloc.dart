import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import '../apis/repository.dart';
import '../model/subcatmodel.dart';

class SubCatBloc {
  final _repository = Repository();
  final _Subcategoryfetcher = PublishSubject<SubCatModel>();

  Stream<SubCatModel> get allsubcategory => _Subcategoryfetcher.stream;

  fetchallSubcategory() async {
    SubCatModel subCatModel = await _repository.getallsubcat();
    _Subcategoryfetcher.sink.add(subCatModel);
  }

  dispose() {
    _Subcategoryfetcher.close();
  }
}

final bloc = SubCatBloc();
