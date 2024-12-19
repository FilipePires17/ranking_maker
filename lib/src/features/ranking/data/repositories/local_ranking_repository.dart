import '../../../../core/result.dart';
import '../../domain/model/rank_item.dart';
import '../../domain/model/ranking.dart';
import '../services/local_ranking_service.dart';
import 'ranking_repository.dart';

class LocalRankingRepository implements IRankingRepository {
  LocalRankingRepository(this._localRankingService);

  final LocalRankingService _localRankingService;

  @override
  Future<Result<Ranking, String>> getRankingById(String id) async {
    if (id.isEmpty) {
      return Failure<Ranking, String>('Invalid id');
    }

    return _localRankingService.getRankingById(id);
  }

  @override
  Future<Result<void, String>> reorderRanking(
      String id, List<RankItem> rankingItems) {
    // TODO: implement reorderRanking
    throw UnimplementedError();
  }

  @override
  Future<Result<List<String>, String>> getRankingIds() {
    // TODO: implement getRankingIds
    throw UnimplementedError();
  }
}
