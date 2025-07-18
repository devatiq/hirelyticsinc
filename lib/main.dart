import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirelyticsinc/core/config/router/app_router.dart';
import 'package:hirelyticsinc/core/utils/constants/app_constants.dart';
import 'package:hirelyticsinc/core/utils/resource/dependency_injection.dart';

import 'app/app.dart';
import 'core/config/theme/app_theme.dart';

/// Entry point of the application
/// ```
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///
///   await setup();
///
///   runApp(const ProviderScope(child: App()));
/// }
/// ```
void main() async {
  // Ensure that the Flutter engine is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Dependency Injection
  await setup();

  runApp(const ProviderScope(child: App()));
}