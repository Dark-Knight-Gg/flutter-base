import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/bloc/observer.dart';
import '../core/logger/app_logger.dart';
import 'app.dart';

void main() async {
  AppLogger.log("runApp");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  Bloc.observer = AppBlocObserver.instance;
  runApp(const MyApp());
}
