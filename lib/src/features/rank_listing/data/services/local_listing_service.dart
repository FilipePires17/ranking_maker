import '../../../../constants/hive/hive_keys.dart';
import '../../../../core/local_data/hive_storage.dart';
import '../../../../core/result.dart';
import '../../../ranking/domain/model/ranking.dart';

abstract class ILocalListingService {
  Future<Result<List<Ranking>, String>> getRankings();

  Future<Result<List<String>, String>> getRankingIds();
}

class LocalListingService implements ILocalListingService {
  final HiveStorage _hiveStorage = HiveStorage();

  @override
  Future<Result<List<String>, String>> getRankingIds() {
    // TODO: implement getRankingIds
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Ranking>, String>> getRankings() async {
    final Map<String, dynamic> result =
        await _hiveStorage.getAllData(HiveBoxNames.rank);

    if (result.isNotEmpty) {
      final List<Ranking> rankings = <Ranking>[];
      result.forEach((String key, dynamic value) {
        rankings.add(Ranking.fromMap(value));
      });

      return Success<List<Ranking>, String>(rankings);
    }

    return Failure<List<Ranking>, String>('Não encontrado');
  }
}
