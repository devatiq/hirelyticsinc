import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirelyticsinc/app/presentation/team/provider/team_provider.dart';
import 'package:hirelyticsinc/app/presentation/team/widget/mobile/mobile_team_list_single_item.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';

class MobileTeamSection extends ConsumerWidget {
  const MobileTeamSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(teamProvider);
    return Container(
      decoration: BoxDecoration(),
      child: provider.when(
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) => GridView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: Dimens.padding16,
                childAspectRatio:  0.66),
            itemBuilder: (_, index) =>
                MobileTeamListSingleItem(item: data[index])),
      ),
    );
  }
}
