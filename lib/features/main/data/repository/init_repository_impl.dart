import '../../domain/repository/init_repository.dart';
import '../cache/cache_manager.dart';

class InitRepositoryImpl implements InitRepository {
  final CacheManager cacheManager;

  InitRepositoryImpl(this.cacheManager);

  @override
  Future<void> init() async {
    await cacheManager.initialize();
  }
}
