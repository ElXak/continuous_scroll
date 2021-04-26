import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';
import 'index_aware_list_item.dart';

class HomeView extends StatelessWidget {
  static const int ListRequestThreshold = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) => ListView.builder(
            itemCount: model.items.length,
            itemBuilder: (context, index) => IndexAwareListItem(
              itemCreated: () {
                int itemNumber = index + 1;
                if (itemNumber % ListRequestThreshold == 0 && index != 0) {
                  SchedulerBinding.instance.addPostFrameCallback((duration) =>
                      model
                          .requestMoreData(itemNumber ~/ ListRequestThreshold));
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(blurRadius: 4, color: Colors.grey[400])
                  ],
                ),
                child: model.items[index] == LoadingIndicatorValue
                    ? CircularProgressIndicator()
                    : Text(model.items[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
