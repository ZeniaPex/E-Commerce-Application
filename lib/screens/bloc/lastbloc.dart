import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import '../apis/repository.dart';
import '../model/lastmodel.dart';

class LastBloc {
  final _repository = Repository();
  final _lastfetcher = PublishSubject<LastModel>();

  Stream<LastModel> get alllastapi => _lastfetcher.stream;

  fetchalllast() async {
    LastModel lastModel = await _repository.getalllast();
    _lastfetcher.sink.add(lastModel);
  }

  dispose() {
    _lastfetcher.close();
  }
}

final bloc = LastBloc();
