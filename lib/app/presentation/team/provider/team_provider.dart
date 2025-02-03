import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirelyticsinc/app/presentation/team/team_data_model.dart';
import 'package:hirelyticsinc/app/presentation/team/team_view_model.dart';
import 'package:hirelyticsinc/core/utils/helper/helper_functions.dart';

import '../../../../core/utils/constants/assets.dart';

final teamProvider = FutureProvider<List<TeamViewModel>>((ref) async {
  print('Loading team list...');
  try {
    // Load JSON data from assets
    final mapList = (await loadJsonFromAssets(Assets.teamsDataJson)) as List;

    // Parse JSON into TeamDataModel objects
    final dataList = mapList.map((e) => TeamDataModel.fromJson(e)).toList();

    // Convert TeamDataModel to TeamViewModel
    return dataList.map((e) => TeamViewModel(
      id: e.id ?? 0,
      name: e.name ?? '-',
      designation: e.designation ?? '-',
      details: e.details ?? '-',
      priority: e.priority ?? 0,
      image: TeamImage(
        sourceName: e.image?.source ?? '',
        url: e.image?.url ?? '',
      ),
      socials: e.socials
          ?.map((e) =>
          TeamSocials(name: e.name ?? '-', url: e.url ?? '-'))
          .toList() ??
          [],
    )).toList();
  } catch (e) {
    print('Error loading team list: $e');
    rethrow; // Re-throw the error to propagate it to the UI
  }
});
