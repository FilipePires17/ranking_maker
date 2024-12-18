import 'package:flutter/material.dart';

import '../../../core/result.dart';
import '../model/rank_item.dart';
import '../model/ranking.dart';
import '../repositories/local_ranking_repository.dart';

class RankingViewModel extends ChangeNotifier {
  final Ranking ranking = Ranking(0, <RankItem>[], '');

  final LocalRankingRepository _rankingRepository;

  RankingViewModel(this._rankingRepository);

  void loadRanking(int id) {
    _rankingRepository
        .getRankingById(id)
        .then((Result<Ranking, String> result) {
      result.fold(
        (Ranking rankingResult) {
          ranking.title = rankingResult.title;
          ranking.rankingItems = rankingResult.rankingItems;
          notifyListeners();
        },
        (String failure) {
          // Handle failure
        },
      );
    });
  }

  void reorder(int oldIndex, int newIndex) {
    final RankItem item = ranking.rankingItems.removeAt(oldIndex);
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    ranking.rankingItems.insert(newIndex, item);
    notifyListeners();
  }

  void saveRanking() {
    // _rankingRepository.reorderRanking(ranking.id, ranking.rankingItems);
  }

  void editItem(int index, String name) {
    ranking.rankingItems[index] =
        ranking.rankingItems[index].copyWith(name: name);
  }
}
