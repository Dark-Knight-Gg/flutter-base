import '../repository/init_repository.dart';
import 'usecase.dart';

class InitCacheUseCase extends NoParamsUseCase<void> {
  final InitRepository initRepository;

  InitCacheUseCase(this.initRepository);

  @override
  Future<void> execute() async {
    await initRepository.init();
  }
}
