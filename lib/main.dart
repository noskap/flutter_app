import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/status/status.dart';
import 'package:flutter_app/widgets/counterObservableWidget.dart';
import 'package:flutter_app/widgets/counterProviderWidget.dart';
import 'package:flutter_app/widgets/more.screen.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'constants/text.constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MaterialApp(
        title: title1,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.deepPurple,
        ),
        home: MyHomePage(title: title2),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Counter {
  BehaviorSubject<int> counter = BehaviorSubject.seeded(0);

  ValueStream<int> get stream$ => counter.stream;

  int get current => counter.value;

  increment() {
    counter.add(current + 1);
  }
}

Counter counterService = Counter();

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  int _counter = 0;

  _incrementCounter(CounterProvider provider) {
    return () {
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        _counter++;
        counterService.increment();
        // Provider.of<CounterProvider>(context).incrementCounter();
        provider.incrementCounter();
      });
    };
  }

  List<Widget> tabs() {
    return [
      Status(_counter),
      Center(
        child: Column(
          children: [
            CounterObservableWidget(),
          ],
        ),
      ),
      Center(
        child: Column(
          children: [
            CounterObservableWidget(),
          ],
        ),
      ),
      Center(
        child: Column(
          children: [
            CounterObservableWidget(),
          ],
        ),
      ),
      Center(
        child: Column(
          children: [
            CounterObservableWidget(),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CounterProvider>(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      endDrawer: MoreScreen(),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(3),
            bottomRight: Radius.circular(3),
          ),
        ),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          children: [
            Text(widget.title + ' ' + _counter.toString()),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.circle_notifications,
                color: Colors.white,
              ),
              onPressed: () {
                //
              },
            ),
          ],
        ),
      ),
      body: tabs()[currentIndex],
      // body: Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     // Column is also a layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Invoke "debug painting" (press "p" in the console, choose the
      //     // "Toggle Debug Paint" action from the Flutter Inspector in Android
      //     // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      //     // to see the wireframe for each widget.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text('Can I be clicked?'),
      //       Text(
      //         'You have pushed the button this many times mother do you want to bang heads with me:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter(provider),
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3),
          topRight: Radius.circular(3),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          showUnselectedLabels: true,
          iconSize: 0,
          selectedItemColor: Colors.deepPurple,
          selectedFontSize: 15,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: Statusnav,
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: Wallet,
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: Events,
              backgroundColor: Colors.orange,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: Bookings,
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: Challenges,
              backgroundColor: Colors.tealAccent,
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
