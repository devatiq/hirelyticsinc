import 'package:flutter/widgets.dart';
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
      child: GridView.builder(
          itemCount: provider.teamList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: Dimens.padding16,
              childAspectRatio: 3 / 4),
          itemBuilder: (_, index) => MobileTeamListSingleItem(
                item: provider.teamList[index],
              )),
    );
  }
}
