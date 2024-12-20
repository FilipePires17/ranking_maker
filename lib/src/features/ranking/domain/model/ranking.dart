import 'rank_item.dart';

class Ranking {
  String id;
  List<RankItem> rankingItems;
  String title;

  Ranking(this.id, this.rankingItems, this.title);

  Ranking copyWith({
    String? id,
    List<RankItem>? rankingItems,
    String? title,
  }) {
    return Ranking(
      id ?? this.id,
      rankingItems ?? this.rankingItems,
      title ?? this.title,
    );
  }

  factory Ranking.fromMap(Map<String, dynamic> map) {
    return Ranking(
      map['id'] as String,
      (map['rankingItems'] as List<RankItem>)
          .map((RankItem e) => RankItem.fromMap(e as Map<String, dynamic>))
          .toList(),
      map['title'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'rankingItems': rankingItems.map((RankItem e) => e.toMap()).toList(),
      'title': title,
    };
  }
}
