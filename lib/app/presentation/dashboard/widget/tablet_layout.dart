import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  final List<Widget> items = const [Text('sdfsdfsff')];

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}
