import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_meiqia/flutter_meiqia.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String res = "未初始化";
  String id = "";
  @override
  void initState() {
    super.initState();
    initMeiQia();
  }

  Future<void> initMeiQia() async {
    try {
      res = await FlutterMeiqia.initMeiQia("b6422ac5bfa9ff376569e81b2cefbdc6");
    } on PlatformException {
      res = 'Failed to get init.';
    }
    if (!mounted) return;

    setState(() {
      res = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('客服Example'),
          ),
          body: Column(
            children: <Widget>[
              Center(
                child: Text('Running on: $res\n'),
              ),
              TextField(
                onChanged: (s) {
                  id = s;
                },
                controller: TextEditingController(text: id),
              ),
              TextButton(
                  onPressed: () async {
                    //562849003
                    Map<String, String> clientInfo = {};
                    clientInfo["userId"] = "";
                    clientInfo["订单ID"] = "";
                    clientInfo["商品ID"] = "";

                    await FlutterMeiqia.openMeiQia(
                        id: "576929681", userInfo: clientInfo, isUpdate: true);
                  },
                  child: const Text("打开客服"))
            ],
          )),
    );
  }
}
