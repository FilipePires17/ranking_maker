import '../../../../core/result.dart';
import '../../../ranking/domain/model/ranking.dart';
import '../services/local_listing_service.dart';

abstract class IListingRepo {
  Future<Result<List<String>, String>> getRankingIds();

  Future<Result<List<Ranking>, String>> getRankings();
}

class ListingRepo implements IListingRepo {
  final ILocalListingService _localListingService;

  ListingRepo(this._localListingService);

  @override
  Future<Result<List<String>, String>> getRankingIds() {
    // TODO: implement getRankingIds
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Ranking>, String>> getRankings() async {
    return await _localListingService.getRankings();
  }
}
