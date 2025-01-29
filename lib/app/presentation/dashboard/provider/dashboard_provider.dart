import 'package:flutter/animation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DashboardProvider {
  final controller = ItemScrollController();

  void scrollToIndex(int index,
      {Duration duration = const Duration(milliseconds: 500),
      Curve curve = Curves.easeInOut}) {
    controller.scrollTo(
      index: index,
      duration: duration,
      curve: curve,
    );
  }
}
