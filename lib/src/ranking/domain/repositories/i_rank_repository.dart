import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../entities/rank.dart';
import '../entities/rank_item.dart';

abstract class IRankRepository {
  Future<Either<Failure, List<Rank>>> getRankingList();
  Future<Either<Failure, Rank>> getRanking(int id);
  Future<Either<Failure, Unit>> createRanking(Rank rank);
  Future<Either<Failure, Unit>> updateRanking(int id, Rank rank);
  Future<Either<Failure, Unit>> deleteRanking(int id);
  Future<Either<Failure, Unit>> deleteRankingItem(int id, int index);
  Future<Either<Failure, Unit>> updateRankingItem(int id, RankItem item);
  Future<Either<Failure, Unit>> addRankingItem(int id, String title);
  Future<Either<Failure, Unit>> updateRankingItemPosition(
      int id, int oldIndex, int newIndex);
}
