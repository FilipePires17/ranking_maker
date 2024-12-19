import '../../../../core/result.dart';
import '../../domain/model/rank_item.dart';
import '../../domain/model/ranking.dart';

abstract class IRankingRepository {
  Future<Result<Ranking, String>> getRankingById(String id);

  Future<Result<void, String>> reorderRanking(
      String id, List<RankItem> rankingItems);

  Future<Result<List<String>, String>> getRankingIds();
}
