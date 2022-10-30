import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CheckConnection extends StatefulWidget{
  const CheckConnection({super.key});

  @override
  State createState() {
    return _CheckConnection();
  }
}

class _CheckConnection extends State{
  StreamSubscription? internetconnection;
  bool isoffline = false;

  @override
  void initState() {
    internetconnection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.none){
        setState(() {
          isoffline = true;
        });
      }else if(result == ConnectivityResult.mobile){
        setState(() {
          isoffline = false;
        });
      }else if(result == ConnectivityResult.wifi){
        setState(() {
          isoffline = false;
        });
      }
    });

    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    internetconnection!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: errorMessage("No Internet Connection Available", isoffline),
    );
  }

  Widget errorMessage(String text,bool show){
    if(show == true){
      return Container(
        padding: const EdgeInsets.all(10.00),
        margin: const EdgeInsets.only(bottom: 10.00),
        color: Colors.red,
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(right:6.00),
            child: const Icon(Icons.info, color: Colors.white),
          ),
          Text(text, style: const TextStyle(color: Colors.white)),
        ]),
      );
    }else{
      return Container();
    }
  }
}