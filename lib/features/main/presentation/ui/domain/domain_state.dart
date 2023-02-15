import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class DomainState extends Equatable {
  const DomainState({
    this.status = FormzStatus.pure,
});
  final FormzStatus status;
  DomainState copyWith({
    FormzStatus? status,
  }) {
    return DomainState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
