import 'package:flutter/material.dart';

import '../model/ranking.dart';
import '../repositories/local_ranking_repository.dart';
import 'ranking_view_model.dart';
import 'widgets/custom_item_tile.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  late final RankingViewModel rankingViewModel =
      RankingViewModel(LocalRankingRepository());

  Ranking get ranking => rankingViewModel.ranking;

  @override
  void initState() {
    super.initState();
    rankingViewModel.addListener(() {
      setState(() {});
    });

    rankingViewModel.loadRanking(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ranking.title),
      ),
      body: ReorderableListView(
        physics: const NeverScrollableScrollPhysics(),
        children: List<Widget>.generate(
          ranking.rankingItems.length,
          (int index) => CustomItemTile(
            ranking.rankingItems[index],
            index,
            key: ValueKey<int>(index),
          ),
        ),
        onReorder: (int oldIndex, int newIndex) {
          // if (oldIndex < newIndex) {
          //   newIndex -= 1;
          // }

          // if (oldIndex % 2 == 0) {
          //   //separator - should never happen
          //   return;
          // }

          // if ((oldIndex - newIndex).abs() == 1) {
          //   //moved behind the top/bottom separator
          //   return;
          // }

          // newIndex = oldIndex > newIndex && newIndex % 2 == 1
          //     ? (newIndex + 1) ~/ 2
          //     : newIndex ~/ 2;
          // oldIndex = oldIndex ~/ 2;
          // onReorder.call(oldIndex, newIndex);
          rankingViewModel.reorder(ranking.id, oldIndex, newIndex);
        },
      ),
    );
  }
}
