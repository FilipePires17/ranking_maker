import 'package:flutter/material.dart';

import '../../../../core/result.dart';
import '../../../ranking/domain/model/ranking.dart';
import '../../data/repos/listing_repo.dart';
import '../../data/services/local_listing_service.dart';

class ListingViewModel extends ChangeNotifier {
  final List<Ranking> items = <Ranking>[];
  String errorMsg = '';
  bool _hasError = false;

  bool get hasError => _hasError;

  final ListingRepo _listingRepo = ListingRepo(LocalListingService());

  void loadRankings() {
    _listingRepo.getRankings().then((Result<List<Ranking>, String> result) {
      result.fold(
        (List<Ranking> rankings) {
          items.clear();
          items.addAll(rankings);
          _hasError = false;
          notifyListeners();
        },
        (String failure) {
          errorMsg = failure;
          _hasError = true;
          notifyListeners();
        },
      );
    });
  }
}
