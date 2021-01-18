import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class CounterProvider extends ChangeNotifier {
  int get getCounter {
    return _count;
  }

  int _count = 0;

  int get count => _count;

  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }
}

class CounterProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterProvider counter = Provider.of<CounterProvider>(context);
    return Card(
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 100,
          child: Column(
            children: [
              StreamBuilder(
                initialData: 0,
                stream: counterService.stream$,
                builder: (BuildContext context, AsyncSnapshot snap) {
                  return Text(
                    '${counter.getCounter}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Text(
                'This number is provided using Provider.of',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
