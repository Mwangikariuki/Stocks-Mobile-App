import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_market_app/screens/landingPage.dart';
import 'package:stock_market_app/view_models/stocks_list_view_model.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => StocksListViewModel(),
      )
    ], child: const LandingPage(),
  ),
));