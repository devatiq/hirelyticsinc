

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Gap(16),
        Text('dfsf'),
      ],
    ));
  }
}
