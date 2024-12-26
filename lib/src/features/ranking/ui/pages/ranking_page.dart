import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../constants/sizes/app_sizes.dart';
import '../../domain/model/ranking.dart';
import '../view_models/ranking_view_model.dart';
import '../widgets/custom_item_tile.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key, this.id});

  final String? id;

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final RankingViewModel rankingViewModel = RankingViewModel();

  Ranking get ranking => rankingViewModel.ranking;

  @override
  void initState() {
    super.initState();
    rankingViewModel.addListener(() {
      setState(() {});
    });

    if (widget.id != null) {
      rankingViewModel.loadRanking(widget.id!);
    } else {
      rankingViewModel.createRanking(const Uuid().v4());
    }
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
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
                  onChanged: (String value) {
                    ranking.title = value;
                    rankingViewModel.saveRanking();
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
