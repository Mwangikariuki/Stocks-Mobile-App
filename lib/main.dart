import 'package:flutter/material.dart';
import 'package:stock_market_app/widgets/auto_complete.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: LandingPage(),
));

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset('assets/raven.jpg',
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.fill,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(40, 0,0,0),
                  child: Text('Ticker Stocks',
                    style: TextStyle(
                        color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            color:const Color.fromRGBO(218, 218, 218, 1.0),
            elevation: 0,
            child: Row(children: const [
              SizedBox(width: 10, height: 50,),
              Icon(Icons.search, color: Color.fromRGBO(150, 150, 150, 1.0),
              ),
            ],),
          ),
        ],),
      ),
    );
  }
}