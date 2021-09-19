import 'package:flutter/material.dart';
import 'package:sample_project/az_list_view/components/country_list.dart';
import 'package:sample_project/az_list_view/pages/alphabet_scroll_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AZ List View'),
      ),
      body: AlphabetScrollList(
        onClickItem: (item) {
          final snackBar = SnackBar(content: Text("Clicked item $item"));

          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(snackBar);
        },
        items: countryList,
      ),
    );
  }
}
