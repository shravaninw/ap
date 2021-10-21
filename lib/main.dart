import 'dart:async';
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

Stream<int> _ap(Stream<Ap> a) {
  return a.asyncExpand((event) => _output(event).map((event) => event));
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
  StreamController<Ap> controller = StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    List<int> a = [1, 2, 3, 4, 5];
    List<int> d = [1, 2, 3, 4, 5];
    List<int> n = [6, 7, 8, 9, 10];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildUserList(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int x = a[Random().nextInt(a.length)];
          int y = d[Random().nextInt(d.length)];
          int z = n[Random().nextInt(n.length)];
          controller.add(Ap(x, y, z));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  StreamBuilder<int> _buildUserList(BuildContext context) {
    List<int> a = [];
    return StreamBuilder(
      stream: _ap(controller.stream),
      builder: (context, AsyncSnapshot<int> snapshot) {
        print('hh ${snapshot.data}');
        if (snapshot.hasData) {
          a.add(snapshot.data!);
          return ListView.builder(
              itemCount: a.length,
              itemBuilder: (_, index) {
                return Text(a[index].toString());
              });
        } else
          return Center(child: CircularProgressIndicator());
        // return ListView.builder(
        //   itemBuilder: (_, index) {
        //     final itemtodo = todos;
        //     return _buildListItem(itemtodo, context);
        //   },
        //   itemCount: ,
        // );
      },
    );
  }

// Widget _buildListItem(Object itemtodo, BuildContext context) {
//   return Center(child: Text('${itemtodo}'));
// }
}
