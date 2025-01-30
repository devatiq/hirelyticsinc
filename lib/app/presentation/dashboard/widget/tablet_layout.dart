import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TabletLayout extends StatelessWidget {
  final ItemScrollController itemScrollController;
  const TabletLayout({super.key, required this.itemScrollController});

  final List<Widget> items = const [Text('sdfsdfsff')];

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: items.length,
      itemScrollController: itemScrollController,
      itemBuilder: (context, index) => items[index],
    );
  }
}
