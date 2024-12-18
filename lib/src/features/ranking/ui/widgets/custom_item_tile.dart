import 'package:flutter/material.dart';

import '../../../../constants/hive/sizes/app_sizes.dart';
import '../../model/rank_item.dart';

class CustomItemTile extends StatelessWidget {
  const CustomItemTile(this.item, this.index, {super.key});

  final RankItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: Sizes.p64),
      padding: const EdgeInsets.all(Sizes.p8),
      // color: Colors.red,
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            ReorderableDragStartListener(
              index: index,
              child: const Icon(
                Icons.drag_indicator,
                color: Colors.grey,
                size: Sizes.p24,
              ),
            ),
            Text(
              '${index + 1}',
              style: const TextStyle(
                fontSize: Sizes.p16,
                color: Colors.grey,
              ),
            ),
            const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
              indent: Sizes.p10,
              endIndent: Sizes.p10,
            ),
            gapW12,
            Expanded(
              child: TextFormField(
                initialValue: item.name,
                style: const TextStyle(
                  fontSize: Sizes.p16,
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onTapOutside: (PointerDownEvent event) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
