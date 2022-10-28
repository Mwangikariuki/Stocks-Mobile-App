import 'dart:convert';

class Stocks {
  final String name;
  final String symbol;
  final String date;
  final double open;
  final double low;
  final double high;
  final double dividend;
  final double close;
  final double volume;

  Stocks({required this.name, required this.symbol, required this.open, required this.low, required this.high, required this.dividend, required this.close, required this.volume, required this.date});

  factory Stocks.fromJson(Map<String, dynamic> json) {
    return Stocks(
      name: json['name'],
      symbol: json['symbol'],
      open: json['open'],
      low: json['low'],
      high: json['high'],
      dividend: json['dividend'],
      close: json['close'],
      volume: json['volume'],
      date: json['date']
    );
  }
}

/*
the expected json
{
"name" : "apple
 "open": 11.57,
  "high": 11.67,
  "low": 11.51,
 "close": 11.51,
"volume": 8531645.0,
"dividend": 0.0,
"symbol": "AAPL",
"date": "2022-10-27T00:00:00+0000"
}
 */