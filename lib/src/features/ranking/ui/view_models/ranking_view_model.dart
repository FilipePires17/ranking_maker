import 'package:flutter/material.dart';

import '../../../../core/result.dart';
import '../../data/services/local_ranking_service.dart';
import '../../domain/model/rank_item.dart';
import '../../domain/model/ranking.dart';
import '../../data/repositories/local_ranking_repository.dart';

class RankingViewModel extends ChangeNotifier {
  final Ranking ranking = Ranking('', <RankItem>[], '');

  final LocalRankingRepository _rankingRepository =
      LocalRankingRepository(LocalRankingService());

  void loadRanking(String id) {
    _rankingRepository
        .getRankingById(id)
        .then((Result<Ranking, String> result) {
      result.fold(
        (Ranking rankingResult) {
          ranking.id = rankingResult.id;
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

  void createRanking(String id) {
    ranking.id = id;
    ranking.rankingItems = <RankItem>[];
    ranking.title = '';

    notifyListeners();
  }
}
