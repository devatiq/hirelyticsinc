import 'package:go_router/go_router.dart';
import 'package:hirelyticsinc/app/presentation/dashboard/page/dashboard_page.dart';
import 'package:hirelyticsinc/core/config/router/routes.dart';


abstract class AppRouter {
  static GoRouter router =
      GoRouter(debugLogDiagnostics: true, initialLocation: '/dashboard', routes: [
    GoRoute(
        name: Routes.dashboard,
        path: '/dashboard',
        builder: (context, state) => const DashboardPage()),
  ]);
}
