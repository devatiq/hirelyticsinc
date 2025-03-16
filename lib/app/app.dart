import 'package:flutter/material.dart';

import '../core/config/router/app_router.dart';
import '../core/config/theme/app_theme.dart';
import '../core/utils/constants/app_constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: AppTheme.appThemeLight,
      darkTheme: AppTheme.appThemeDark,
      themeMode: ThemeMode.light,
    );
  }
}
