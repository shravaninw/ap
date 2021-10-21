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

Stream<int> _output(Ap ap) async* {
  print('${ap.a}   ${ap.d}   ${ap.n}');
  int val = ap.a;
  int dif = ap.d;
  for (int i = 1; i <= ap.n; i++) {
    yield val;
    val = val + dif;
  }
}

Stream<int> _Ap(Stream<Ap> a) {
  return a.asyncExpand((event) => _output(event).map((events) {
        //print(events);
        return events;
      }));
  // a.listen((event) {
  //   print(event.a);
  // });
  // return a.asyncExpand((value) =>
  //   print(value.a);
  //   return _output(value).m
  //     event,
  //   ) {
  //     print(value.d);
  //     int val = value.a;
  //     int init = value.a;
  //     int dif = value.d;
  //     for (int i = 1; i < value.n; i++) {
  //       val = val + dif;
  //     }
  //     return val;
  //   });
  // });
  //   Stream<int> _ap;
  //
  //     return()
  //   }
  //   return _ap;
  // });
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
      print('AP $event');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(''),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
