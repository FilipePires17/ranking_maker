class RankItem {
  final String name;

  RankItem(this.name);

  RankItem copyWith({String? name}) {
    return RankItem(name ?? this.name);
  }
}
