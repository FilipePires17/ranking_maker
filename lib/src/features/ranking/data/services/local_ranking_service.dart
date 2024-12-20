import '../../../../constants/hive/hive_keys.dart';
import '../../../../core/local_data/hive_storage.dart';
import '../../../../core/result.dart';
import '../../domain/model/ranking.dart';

class LocalRankingService {
  final HiveStorage _hiveStorage = HiveStorage();

  Future<Result<Ranking, String>> getRankingById(String id) async {
    final dynamic result =
        await _hiveStorage.getData(HiveBoxNames.rank, id.toString());

    if (result != null) {
      return Success<Ranking, String>(result as Ranking);
    }

    return Failure<Ranking, String>('Não encontrado');
  }

  Future<Result<void, String>> saveRanking(Ranking ranking) async {
    if (await _hiveStorage.saveData(
      HiveBoxNames.rank,
      ranking.id,
      ranking.toMap(),
    )) {
      return Success<void, String>(null);
    }

    return Failure<void, String>('Erro ao salvar');
  }

  Future<bool> deleteRanking(String id) async {
    return await _hiveStorage.deleteData(HiveBoxNames.rank, id.toString());
  }
}
