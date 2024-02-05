import 'package:equatable/equatable.dart';

import 'rank_item.dart';

class Rank extends Equatable {
  const Rank({
    required this.id,
    required this.title,
    required this.items,
    required this.createdAt,
    this.modifiedAt,
  });

  final String id;
  final String title;
  final List<RankItem> items;
  final DateTime createdAt;
  final DateTime? modifiedAt;

  @override
  List<Object> get props => <Object>[
        id,
        items,
        title,
        createdAt,
        modifiedAt ?? createdAt,
      ];

  Rank copyWith({
    String? id,
    String? title,
    List<RankItem>? items,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) {
    return Rank(
      id: id ?? this.id,
      title: title ?? this.title,
      items: items ?? this.items,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }
}
