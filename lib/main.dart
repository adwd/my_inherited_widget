import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Counter(child: new MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class Count {
  int value;
  Count(this.value);
}

class Counter extends InheritedWidget {
  Counter({
    Key key,
    Widget child,
  }): super(key: key, child: child);

  final Count _count = new Count(0);

  static Counter of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(Counter);
  }

  void addCount() {
    _count.value++;
  }

  int get count => _count.value;

  @override
  bool updateShouldNotify(Counter old) {
    print('${_count.value}, ${old._count.value}');
    return _count.value != old._count.value;
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}): super(key: key);

  @override
  State<MyHomePage> createState() => new MyHomePageState();
}


class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              Counter.of(context).count.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Counter.of(context).addCount();
          setState((){});
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
