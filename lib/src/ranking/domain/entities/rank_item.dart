import 'package:equatable/equatable.dart';

class RankItem extends Equatable {
  final String title;
  final int position;

  const RankItem({
    required this.title,
    required this.position,
  });

  @override
  List<Object?> get props => <Object>[
        title,
        position,
      ];
}
