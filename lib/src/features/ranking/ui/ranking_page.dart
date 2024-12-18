import 'package:flutter/material.dart';

import '../../../constants/hive/sizes/app_sizes.dart';
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
      body: Column(
        children: <Widget>[
          gapH40,
          Row(
            children: <Widget>[
              gapW16,
              const Icon(
                Icons.arrow_back_ios,
              ),
              gapW16,
              Expanded(
                child: TextFormField(
                  initialValue: ranking.title,
                  style: const TextStyle(
                    fontSize: Sizes.p24,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  onTapOutside: (PointerDownEvent event) {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ReorderableListView(
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
                rankingViewModel.reorder(oldIndex, newIndex);
              },
            ),
          ),
        ],
      ),
    );
  }
}
