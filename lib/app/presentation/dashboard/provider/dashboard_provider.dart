import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// Riverpod provider
final dashboardProvider = Provider<DashboardProvider>((ref) {
  return DashboardProvider();
});

class DashboardProvider {
  final controller = ItemScrollController();

  void scrollToIndex(int index,
      {Duration duration = const Duration(milliseconds: 1000),
      Curve curve = Curves.easeInOut}) {
    controller.scrollTo(
      index: index,
      duration: duration,
      curve: curve,
    );
  }
}
