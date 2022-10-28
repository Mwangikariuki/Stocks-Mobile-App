import 'package:flutter/material.dart';
import 'package:stock_market_app/view_models/stock_view_model.dart';
import '../models/all_stocks.dart';
import '../services/stocks_service.dart';

enum LoadingStatus {
  completed,
  searching,
  empty
}

class StocksListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<StocksViewModel> stocks = <StocksViewModel>[];

  void allStocks() async {
    List<Stocks> stocks = await StockWebService().fetchAllStocks();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.stocks = stocks.map((stock) => StocksViewModel(stock: stock)).toList();

    if (this.stocks.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}