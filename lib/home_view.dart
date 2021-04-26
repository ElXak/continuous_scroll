import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'continuous_scrolling_list.dart';
import 'home_view_model.dart';
import 'list_item.dart';

class HomeView extends StatelessWidget {
  static const int ListRequestThreshold = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) => ContinuousScrollingList(
            items: model.items,
            itemNumberThreshold: ListRequestThreshold,
            thresholdReached: (index) {
              SchedulerBinding.instance.addPostFrameCallback((duration) =>
                  model.requestMoreData(index ~/ ListRequestThreshold));
            },
            itemBuilder: (context, index) =>
                ListItem(title: model.items[index]),
          ),
        ),
      ),
    );
  }
}
