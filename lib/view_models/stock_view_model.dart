import 'package:stock_market_app/models/all_stocks.dart';

class StocksViewModel {
  Stocks _stocks;

  StocksViewModel({required Stocks stock}) : _stocks = stock;

  // String get name {
  //   return _stocks.name;
  // }

  String get symbol {
    return _stocks.symbol;
  }

  String get date {
    return _stocks.date;
  }

  double get open {
    return _stocks.open;
  }

  double get low {
    return _stocks.low;
  }

  double get high {
    return _stocks.high;
  }

  double? get close {
    return _stocks.close;
  }

  dynamic get volume {
    return _stocks.volume;
  }
}