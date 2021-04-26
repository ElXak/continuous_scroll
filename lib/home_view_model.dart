import 'package:flutter/material.dart';

const String LoadingIndicatorValue = '^';

class HomeViewModel extends ChangeNotifier {
  List<String> _items;

  List<String> get items => _items;

  int _currentPage = 0;

  HomeViewModel() {
    _items = List<String>.generate(15, (index) => 'Title $index');
    // _items.insert(0, LoadingIndicatorValue);
  }

  Future requestMoreData(int pageRequest) async {
    print('requestMoreData for page: $pageRequest with current: $_currentPage');

    if (pageRequest > _currentPage) {
      _currentPage = pageRequest;
      _showLoadingItem();

      await Future.delayed(Duration(seconds: 2));
      List<String> newListItems =
          List<String>.generate(15, (index) => 'Title New $index');
      _items.addAll(newListItems);

      _removeLoadingItem();
    }
  }

  void _showLoadingItem() {
    _items.add(LoadingIndicatorValue);
    notifyListeners();
  }

  void _removeLoadingItem() {
    _items.remove(LoadingIndicatorValue);
    notifyListeners();
  }
}
