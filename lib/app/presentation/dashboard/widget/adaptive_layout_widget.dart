import 'package:flutter/widgets.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';

class AdaptiveLayoutWidget extends StatelessWidget {
  final WidgetBuilder mobileLayout;
  final WidgetBuilder tabletLayout;

  const AdaptiveLayoutWidget(
      {super.key, required this.mobileLayout, required this.tabletLayout});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <=  Dimens.maxMobileWidthBreakPoint) {
        return mobileLayout(context);
      } else {
        return tabletLayout(context);
      }
    });
  }
}
