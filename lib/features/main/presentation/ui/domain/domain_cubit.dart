import 'package:formz/formz.dart';

import '../../../../../core/core.dart';
import '../../../domain/usecase/fetch_domain_usecase.dart';
import 'domain_state.dart';

class DomainCubit extends BaseCubit<DomainState> {
  final FetchDomainUsecase fetchDomainUsecase;

  DomainCubit(this.fetchDomainUsecase);

  @override
  void start() {

  }

  void onUsernameChanged(String userName) {
    if (userName.isNotEmpty) {
      emit(state.value?.copyWith(
          status: FormzStatus.valid,
      ) as StateWrapper<DomainState>
      );
    }
  }
}