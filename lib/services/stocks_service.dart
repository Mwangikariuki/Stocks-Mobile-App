import 'package:dio/dio.dart';
import 'package:stock_market_app/models/all_stocks.dart';

class StockWebService {
  var dio = new Dio();

  Future<List<Stocks>> fetchAllStocks() async {
   // String url = "http://api.marketstack.com/v1/exchanges/XNAS/eod?access_key=7d2bd7e0bc6c07bac5dedd3d9beadefe&symbols=AAPL,MSFT,AMZN,GOOGL,BABA,FB,VOD,V,JPM,JNJ& date_from = 2022-10-17& date_to = 2022-10-17";

    String url = "http://192.168.100.38:4000/api";

    // String url = "http://api.marketstack.com/v1/intraday/latest?access_key=f9e890c73419b36a35f8d4d332887d74&symbols=AAPL,MSFT,AMZN,GOOGL,BABA,FB,VOD,V,JPM,JNJ";

    final response  = await dio.get(url);

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['data'];
      return list.map((stock) => Stocks.fromJson(stock)).toList();
    } else {
      throw Exception("Could not get the relevant stocks");
    }
  }
}