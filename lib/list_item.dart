import 'package:flutter/material.dart';

import 'home_view_model.dart';

class ListItem extends StatelessWidget {
  final String title;

  const ListItem({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey[400])],
      ),
      child: title == LoadingIndicatorValue
          ? CircularProgressIndicator()
          : Text(title),
    );
  }
}
