import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirelyticsinc/app/presentation/team/team_data_model.dart';
import 'package:hirelyticsinc/app/presentation/team/team_view_model.dart';
import 'package:hirelyticsinc/core/utils/helper/helper_functions.dart';

import '../../../../core/utils/constants/assets.dart';

final teamProvider = Provider<TeamProvider>((ref) => TeamProvider());

class TeamProvider {
  List<TeamViewModel> teamList = [];

  void populateTeamList() async {
    try {
      final mapList = await loadJsonFromAssets(Assets.teamsDataJson) ;
      print('---------');
      print(mapList.runtimeType);
      print(mapList);
      print('---------');
      final dataList = mapList.map((e) => TeamDataModel.fromJson(e)).toList();
      teamList = dataList
          .map((e) => TeamViewModel(
                id: e.id ?? 0,
                name: e.name ?? '-',
                designation: e.designation ?? '-',
                details: e.details ?? '-',
                priority: e.priority ?? 0,
                image: TeamImage(
                    sourceName: e.image?.source ?? '', url: e.image?.url ?? ''),
                socials: e.socials
                        ?.map((e) =>
                            TeamSocials(name: e.name ?? '-', url: e.url ?? '-'))
                        .toList() ??
                    [],
              ))
          .toList();
    } catch (e) {
      print('error $e');
    }
  }

  TeamProvider() {
    populateTeamList();
  }
}
