import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../progress/progress_event.dart';
import 'state_wrapper.dart';
import 'view_state.dart';

abstract class BaseCubit<V> extends Cubit<StateWrapper<V>> {
  BaseCubit.create(super.initialState) {
    start();
  }

  BaseCubit.value(V? value) : this.create(StateWrapper<V>(value: value));

  BaseCubit() : this.create(StateWrapper<V>());

  void start() {}

  void refresh() {}

  void onEventResult(dynamic event, dynamic response) {}

  Future<void> doWithProgress(FutureOr<void> Function() block) async {
    showProgress();
    await block();
    hideProgress();
  }

  void emitNewValue(V? value) {
    emit(state.copyWith(value: value));
  }

  void emitNewEvent(dynamic event) {
    emit(state.copyWith(event: event));
  }

  void showContent() {
    emit(state.copyWith(viewState: ViewState.content));
  }

  void showLoading() {
    emit(state.copyWith(viewState: ViewState.loading));
  }

  void showEmpty() {
    emit(state.copyWith(viewState: ViewState.empty));
  }

  void showError() {
    emit(state.copyWith(viewState: ViewState.error));
  }

  void showProgress() {
    emit(state.copyWith(event: ProgressEvent.show()));
  }

  void hideProgress() {
    emit(state.copyWith(event: ProgressEvent.hide()));
  }
}
