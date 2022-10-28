import 'package:dio/dio.dart';
import 'package:stock_market_app/models/all_stocks.dart';

class StockWebService {
  var dio = new Dio();

  Future<List<Stocks>> fetchAllStocks() async {
    String url = "";

    final response  = await dio.get(url);

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['stocks'];
      return list.map((stock) => Stocks.fromJson(stock)).toList();
    } else {
      throw Exception("Could not get the relevant stocks");
    }
  }
}