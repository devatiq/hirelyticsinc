import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirelyticsinc/app/presentation/team/provider/team_provider.dart';
import 'package:hirelyticsinc/app/presentation/team/widget/mobile/mobile_team_list_single_item.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';

class TabletTeamSection extends ConsumerWidget {
  const TabletTeamSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(teamProvider);
    return Container(
      decoration: const BoxDecoration(),
      child: provider.when(
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) => GridView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: Dimens.padding16,
                crossAxisSpacing: Dimens.padding16,
                childAspectRatio:  0.8),
            itemBuilder: (_, index) =>
                MobileTeamListSingleItem(item: data[index])),
      ),
    );
  }
}
