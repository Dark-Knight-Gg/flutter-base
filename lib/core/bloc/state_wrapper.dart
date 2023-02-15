import 'view_state.dart';

class StateWrapper<V> {
  final ViewState? viewState;
  final String? message;
  final V? value;
  final dynamic event;

  const StateWrapper({this.value, this.message, this.viewState, this.event});

  StateWrapper<V> copyWith({
    ViewState? viewState,
    String? message,
    V? value,
    dynamic event,
  }) {
    return StateWrapper(
      viewState: viewState ?? this.viewState,
      message: message ?? this.message,
      value: value ?? this.value,
      event: event ?? this.event,
    );
  }
}
