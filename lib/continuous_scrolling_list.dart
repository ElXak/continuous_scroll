import 'package:flutter/material.dart';

import 'index_aware_list_item.dart';

class ContinuousScrollingList<T> extends StatelessWidget {
  final List<T> items;

  // The index of the item in the list of values,
  // not the index of value in the list.
  final int itemNumberThreshold;
  final Function(int) thresholdReached;
  final Function(BuildContext, int) itemBuilder;

  const ContinuousScrollingList(
      {Key key,
      @required this.items,
      @required this.itemNumberThreshold,
      @required this.thresholdReached,
      this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => IndexAwareListItem(
        itemCreated: () {
          int itemNumber = index + 1;
          if (itemNumber % itemNumberThreshold == 0 && index != 0) {
            thresholdReached(itemNumber);
          }
        },
        child: itemBuilder(context, index),
      ),
    );
  }
}
