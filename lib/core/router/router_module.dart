import 'package:injectable/injectable.dart';

import 'app_router.dart';

@module
abstract class RouterModule {
  @lazySingleton
  AppRouter get appRouter => AppRouter();
}
