import '../../../core/result.dart';
import '../model/rank_item.dart';
import '../model/ranking.dart';

abstract class IRankingRepository {
  Future<Result<Ranking, String>> getRankingById(int id);

  Future<Result<void, String>> reorderRanking(
      int id, List<RankItem> rankingItems);
}
