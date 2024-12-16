import '../../../core/result.dart';
import '../model/rank_item.dart';
import '../model/ranking.dart';
import 'ranking_repository.dart';

class LocalRankingRepository implements IRankingRepository {
  @override
  Future<Result<Ranking, String>> getRankingById(int id) async {
    if (id < 0) {
      return Failure<Ranking, String>('Invalid id');
    }

    // TODO: Implement fetching from local storage
    return Success<Ranking, String>(
      Ranking(
        <RankItem>[
          RankItem('John Doe'),
          RankItem('Jane Doe'),
          RankItem('Alice'),
        ],
      ),
    );
  }
}
