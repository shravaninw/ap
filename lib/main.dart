import 'dart:math';

import 'package:flutter/material.dart';

class Ap {
  Ap(this.a, this.d, this.n);

  final int a;
  final int d;
  final int n;
}

Stream<Ap> _input() async* {
  List<int> a = [1, 2, 3, 4, 5];
  List<int> d = [1, 2, 3, 4, 5];
  List<int> n = [6, 7, 8, 9, 10];
  int x = a[Random().nextInt(a.length)];
  int y = d[Random().nextInt(d.length)];
  int z = n[Random().nextInt(n.length)];

  yield Ap(x, y, z);
}

Stream _Ap(Stream <Ap> a) {
  return
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _increment() {
    _Ap(_input()).listen((event) {
      print(event);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                  'You have pushed the button this many times:'),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
