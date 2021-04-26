import 'package:flutter/material.dart';

class IndexAwareListItem extends StatefulWidget {
  final Widget child;
  final Function itemCreated;

  IndexAwareListItem({Key key, this.child, this.itemCreated}) : super(key: key);

  @override
  _IndexAwareListItemState createState() => _IndexAwareListItemState();
}

class _IndexAwareListItemState extends State<IndexAwareListItem> {
  @override
  void initState() {
    super.initState();
    if (widget.itemCreated != null) {
      widget.itemCreated();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
