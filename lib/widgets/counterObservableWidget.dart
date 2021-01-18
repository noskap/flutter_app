import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/text.constants.dart';

import '../main.dart';

class CounterObservableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    '${snap.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Text(
                counterObserved,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
