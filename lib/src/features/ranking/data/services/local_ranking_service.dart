import '../../../../core/local_data/hive_storage.dart';
import '../../../../core/result.dart';
import '../../domain/model/ranking.dart';

class LocalRankingService {
  final HiveStorage _hiveStorage = HiveStorage();

  Future<Result<Ranking, String>> getRankingById(String id) async {
    final dynamic result = await _hiveStorage.getData('ranking', id.toString());

    if (result != null) {
      return Success<Ranking, String>(result as Ranking);
    }

    return Failure<Ranking, String>('Não encontrado');
  }

  Future<Result<void, String>> saveRanking(String? id, Ranking ranking) async {
    if (await _hiveStorage.saveData('ranking', id.toString(), ranking)) {
      return Success<void, String>(null);
    }

    return Failure<void, String>('Erro ao salvar');
  }

  Future<bool> deleteRanking(String id) async {
    return await _hiveStorage.deleteData('ranking', id.toString());
  }
}
