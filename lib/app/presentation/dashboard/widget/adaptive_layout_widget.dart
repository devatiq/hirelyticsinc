import 'package:flutter/widgets.dart';

class AdaptiveLayoutWidget extends StatelessWidget {
  final WidgetBuilder mobileLayout;
  final WidgetBuilder tabletLayout;

  const AdaptiveLayoutWidget(
      {super.key, required this.mobileLayout, required this.tabletLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return mobileLayout(context);
      } else {
        return tabletLayout(context);
      }
    });
  }
}
