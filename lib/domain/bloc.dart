import 'dart:async';

import 'package:matcher/matcher.dart';
import 'package:todo/domain/model_info.dart';

enum BlocEvent { sign_in_button, sign_withGoogel }

class Bloc1 {

  String _string = '';
  final _inputEventController = StreamController<BlocEvent>();

  StreamSink<BlocEvent> get inputEventSink => _inputEventController.sink;
  final _outputEventController = StreamController<dynamic>();

  Stream<dynamic> get outputStateStream => _outputEventController.stream;

  _mapEventresponse(BlocEvent event) {
    if (event == BlocEvent.sign_in_button) {
      return true;
    } // ?
    else if ( event == BlocEvent.sign_withGoogel) {
      return true;
    }
    else {
      throw Exception('Wrong event');
    }
    _outputEventController.sink.add();
  }

  Bloc1() {
    _inputEventController.stream.listen((_mapEventresponse));
  }

  void dispose() {
    _inputEventController.close();
    _outputEventController.close();
  }

}