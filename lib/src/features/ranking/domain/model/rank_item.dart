class RankItem {
  final String name;

  RankItem(this.name);

  RankItem copyWith({String? name}) {
    return RankItem(name ?? this.name);
  }

  factory RankItem.fromMap(Map<String, dynamic> map) {
    return RankItem(map['name'] as String);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
