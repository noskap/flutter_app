import 'package:flutter/material.dart';
import 'package:flutter_app/constants/text.constants.dart';
import 'package:flutter_app/widgets/counterObservableWidget.dart';
import 'package:flutter_app/widgets/counterProviderWidget.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(3),
                  bottomRight: Radius.circular(3),
                ),
              ),
              title: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Dismiss this screen
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(),
                  Text(menuPlaceholder1),
                  Spacer(),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text(menuPlaceholder2),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text(menuPlaceholder3),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(menuPlaceholder4),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text(menuPlaceholder5),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(menuPlaceholder6),
              onTap: () => {Navigator.of(context).pop()},
            ),
            CounterObservableWidget(),
            CounterProviderWidget(),
          ],
        ),
      ),
    );
  }
}
