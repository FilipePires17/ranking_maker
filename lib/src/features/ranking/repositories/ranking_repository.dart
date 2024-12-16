import '../../../core/result.dart';
import '../model/ranking.dart';

abstract class IRankingRepository {
  Future<Result<Ranking, String>> getRankingById(int id);
}
