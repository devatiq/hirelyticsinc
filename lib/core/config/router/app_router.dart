import 'package:go_router/go_router.dart';
import 'package:hirelyticsinc/app/presentation/dashboard/page/dashboard_page.dart';
import 'package:hirelyticsinc/core/config/router/routes.dart';

import '../../../app/presentation/team/page/mobile/mobile_team_details_page.dart';
import '../../../app/presentation/team/team_view_model.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/dashboard',

      routes: [
        GoRoute(
            name: Routes.dashboard,
            path: '/dashboard',
            builder: (context, state) => const DashboardPage(),
            routes: [
              GoRoute(
                  name: Routes.memberDetails,
                  path: 'member-details',
                  builder: (context, state) {
                    final model = state.extra as TeamViewModel;

                    return MobileTeamDetailsPage(model: model);
                  }),
            ]),
      ]);
}
