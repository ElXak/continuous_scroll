import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) => ListView.builder(
            itemCount: model.items.length,
            itemBuilder: (context, index) => Container(
              alignment: Alignment.center,
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey[400])],
              ),
              child: Text(model.items[index]),
            ),
          ),
        ),
      ),
    );
  }
}
