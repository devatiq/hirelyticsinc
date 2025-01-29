
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';


import '../constants/assets.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await _deviceOrientation();

  await initDirectory();

  //await _registerHive();

  registeredRepositoryAndServices();

  await _svgLoader();
}



Future<void> _svgLoader() async {
  // const loader = SvgAssetLoader(Assets.logo);
  // await svg.cache.putIfAbsent(
  //     loader.cacheKey(null), () async => await loader.loadBytes(null));
}

String appDirectoryPath = '';

Future<void> initDirectory() async {
  final directory = await getApplicationSupportDirectory();
  appDirectoryPath = directory.path;
}

Future<void> _deviceOrientation() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

// Future<void> _registerHive() async {
//   await Hive.initFlutter();
//
//   if (!Hive.isAdapterRegistered(sessionAuthModelTypeId)) {
//     Hive.registerAdapter(SessionAuthModelAdapter());
//   }
//   await Hive.openBox('${AppConstants.appName.toLowerCase()}_session');
// }


T _registerIfNot<T extends Object>(T t) {
  final isRegistered = getIt.isRegistered<T>(instance: t);
  if (!isRegistered) {
    t = getIt.registerSingleton<T>(t);
  }
  return t;
}

void _registerLazyIfNot<T extends Object>(T t) {
  final isRegistered = getIt.isRegistered<T>(instance: t);
  if (!isRegistered) {
    getIt.registerLazySingleton<T>(() => t);
  }
}


void registeredRepositoryAndServices() {
  /*
  //base local service - start
  final baseLocalDatabase = _registerIfNot<AppDatabase>(AppDatabase());
  //base local service - end

  //base api - start
  final baseApiService = _registerIfNot<BaseApiService>(BaseApiService());
  //base api - end

  /// service
  //session service (hive) - start
  final sessionService = _registerIfNot<T>(T());

  //session service (hive) - end

  //local database service (drift) - start

  final localService =
      _registerIfNot<T>(T(baseLocalDatabase));

  //local database service (drift) - end

  //api service (dio) - start

  final authRemoteService =
      _registerIfNot<T>(T(baseApiService));


  //api service (dio) - end

  ///repositories

  final repo = _registerIfNot<T>(T(
    remoteService: service,
  ));

  //register auth use case
  _registerLazyIfNot<T>(T(repo));
  _
   */
}
