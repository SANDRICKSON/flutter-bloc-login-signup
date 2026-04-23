import 'package:bloc/bloc.dart';
import 'dart:developer';
class SimpleBlocObserver extends BlocObserver{
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    // TODO: implement onCreate
    super.onCreate(bloc);
    log('onCreate --bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
    log('onEvent -- bloc: ${bloc.runtimeType},event:$event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {

    super.onChange(bloc, change);
    log('onChange --bloc: ${bloc.runtimeType},change:$change');
  }
}