import 'package:flutter/material.dart';
import 'package:sample_project/alphabet_scrolable_list/widgets/index_list_view.dart';

class MyListView extends StatelessWidget {

  final itemHeight = 50.0;

  final items = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Brazil",
    "Indonesia",
    "Netherlands",
    "USA",
  ];

  Widget itemWidget(BuildContext context, int index) {
    return Text(items[index]);
  }

  Widget titleWidget(BuildContext context) {
    return Text(
      "Country List",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 24.0
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alphabet Scroll List'),
        ),
        body: Column(
          children: <Widget>[
            titleWidget(context),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IndexedListView(
                  itemHeight: itemHeight,
                  items: items,
                  itemBuilder: itemWidget,
                ),
              ),
            )
          ],
        )
    );
  }
}