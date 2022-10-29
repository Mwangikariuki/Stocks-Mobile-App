import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_market_app/view_models/stocks_list_view_model.dart';
import 'package:stock_market_app/widgets/check_connection.dart';
import '../widgets/app_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<StocksListViewModel>(context, listen: false).allStocks();
  }

  @override
  Widget build(BuildContext context) {
    const List<String> kOptions = <String>[
      'aardvark',
      'bobcat',
      'chameleon',
    ];
    var listViewModel = Provider.of<StocksListViewModel>(context);
    print(listViewModel.stocks.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(153, 204, 255, 1.0),
        title: const AppBarWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            const CheckConnection(),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return kOptions.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                debugPrint('You just selected $selection');
              },
            ),
            const SizedBox(height: 20,),
            GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
             // childAspectRatio: 2.0,
            ),
                physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                var sym = listViewModel.stocks[index].symbol;
                String name;
                if(sym == "AAPL"){
                  name = "Apple";
                } else if (sym == "MSFT"){
                  name = "Microsoft";
                } else if (sym == "AMZN") {
                  name = "Amazon";
                } else if (sym == "GOOGL") {
                  name = "Alphabet Inc";
                } else if (sym == "FB") {
                  name = "Meta Platforms Inc";
                } else if (sym == "V") {
                  name = "Visa Inc";
                } else if (sym == "JPM") {
                  name = "JPMorgan Chase & Company";
                } else if (sym == "JNJ") {
                  name = "Johnson & Johnson";
                } else if (sym == "VOD") {
                  name = "Vodafone Group plc";
                } else if(sym == "BABA") {
                  name = "Alibaba Group Holding Ltd";
                }
                else {
                  throw Exception('Unknown Ticker');
                }
                return GridTile(
                  child: Card(
                    elevation: 0,
                    child: Column(children: [
                      Text(name),
                      Text(listViewModel.stocks[index].volume.toString()),
                    ],),
                  ),
                );
              },
              itemCount: listViewModel.stocks.length,
              shrinkWrap: true,
            ),
          ],
          ),
        ),
      )
    );
  }
}