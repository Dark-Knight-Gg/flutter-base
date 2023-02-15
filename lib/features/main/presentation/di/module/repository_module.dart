import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/domain_repository_impl.dart';
import '../../../data/repository/init_repository_impl.dart';
import '../../../domain/repository/domain_repository.dart';
import '../../../domain/repository/init_repository.dart';

abstract class RepositoryModule {
  static RepositoryProvider<InitRepository> _provideInitRepository() {
    return RepositoryProvider(
      create: (context) => InitRepositoryImpl(context.read()),
    );
  }

  static RepositoryProvider<DomainRepository> _provideDomainRepository() {
    return RepositoryProvider(
      create: (context) => DomainRepositoryImpl(context.read()),
    );
  }

  static List<RepositoryProvider> dependencies() {
    return [
      _provideInitRepository(),
      _provideDomainRepository(),
    ];
  }
}
